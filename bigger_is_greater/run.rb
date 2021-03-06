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

require 'pry-byebug'
def faster_solution(s)
  hash = s.chars.inject(Hash.new) { |result, e| result[e] = e.ord; result }

  (s.length - 1).downto(0) do |i|
    current_char     = s[i]
    current_char_val = hash[current_char]
    unless hash[current_char] == s.length  # Greatest lexographical char

      next_greatest_val = 'z'.ord + 1
      next_greatest_char = nil

      right_of_current_char = s[(i+1)..-1].chars

      if !right_of_current_char.empty?
        right_of_current_char.each do |possible_swap_char|
          possible_swap_char_val = hash[possible_swap_char]
          if possible_swap_char_val > current_char_val && possible_swap_char_val < next_greatest_val
            next_greatest_val = possible_swap_char_val
            next_greatest_char = possible_swap_char
          end
        end

        if next_greatest_char
          possible_swap_char_idx = s[i+1..-1].index(next_greatest_char) + 1 + i
          s[i] = next_greatest_char
          s[possible_swap_char_idx] = current_char
          s[i+1..-1] = s[i+1..-1].chars.sort.join
          return s
        end
      end
    else
      # Because theres nothing lexographically greater in the string to swap this char with
      next
    end
  end
  'no answer'
end


# Credit - https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
def fastest_solution(s)
  chars = s.chars
  non_increasing_suffix_idx = chars.length - 1

  # Find the largest non-increasing suffix
  while non_increasing_suffix_idx > 0 and chars[non_increasing_suffix_idx - 1] >= chars[non_increasing_suffix_idx]
    non_increasing_suffix_idx -= 1
  end

  return 'no answer' if non_increasing_suffix_idx <= 0

  j = chars.length - 1
  while chars[j] <= chars[non_increasing_suffix_idx - 1]
    j -= 1
  end
  chars[non_increasing_suffix_idx - 1], chars[j] = chars[j], chars[non_increasing_suffix_idx - 1]

  pivot_idx = non_increasing_suffix_idx - 1

  # Reverse the suffix.
  (chars[0..pivot_idx] + chars[(pivot_idx + 1)..-1].reverse).join
end

#
p fastest_solution('ab') == 'ba'
p fastest_solution('bb') == 'no answer'
p fastest_solution('hefg') == 'hegf'
p fastest_solution('dhck') == 'dhkc'
p fastest_solution('dkhc') == 'hcdk' #hkdc

# file = File.readlines('input.txt')
# file.each do |line|
#   puts "line: #{line}"
#   puts faster_solution(line)
# end
