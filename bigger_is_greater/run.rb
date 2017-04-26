# # https://www.hackerrank.com/challenges/bigger-is-greater
# def bf_solution(s)
#   sorted_string = s.chars.sort.join
#   permuts       = sorted_string.chars.permutation(s.length)
#   s_idx         = nil
#
#   as_words = permuts.map.with_index do |permut, idx|
#     s_idx = idx if permut.join == s
#     permut.join('')
#   end
#
#   next_greater = as_words[s_idx + 1]
#   next_greater ? next_greater : 'no answer'
# end


def faster_solution(s)
  sorted = s.chars.sort
  hash   = sorted.each_with_index.inject({}) do |result, thing|
    char, idx = thing
    result[char] = idx
    result
  end

  (s.length - 1).downto(0) do |i|
    current_char     = s[i]
    current_char_val = hash[current_char]
    unless hash[current_char] == s.length  # Greatest lexographical char

      next_greatest = current_char_val

      right_of_current_char = s[(i+1)..-1].chars.sort
      if !right_of_current_char.empty?
        right_of_current_char.each do |possible_swap_char|
          possible_swap_char_val = hash[possible_swap_char_val]
          if hash[possible_swap_char] > next_greatest
            # 1.  swap this greater_char with the current char
            # 2.  sort the chars after the current_chars index and rejoin so that they are the lowest they could possible be lexographically

            possible_swap_char_idx = s[i+1..-1].index(possible_swap_char) + 1 + i
            s[i] = possible_swap_char
            s[possible_swap_char_idx] = current_char
            s[i+1..-1] = s[i+1..-1].chars.sort.join
            return s
          end
        end
      end
    else
      # Because theres nothing lexographically greater in the string to swap this char with
      next
    end
  end
  'no answer'
end

#
p faster_solution('ab') == 'ba'
p faster_solution('bb') == 'no answer'
p faster_solution('hefg') == 'hegf'
p faster_solution('dhck') == 'dhkc'
p faster_solution('dkhc') == 'hcdk' #hkdc

# file = File.readlines('input.txt')
# file.each do |line|
#   puts "line: #{line}"
#   puts faster_solution(line)
# end
