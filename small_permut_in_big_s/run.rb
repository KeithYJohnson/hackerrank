def solution(small, large)
  found_permuts = []

  large.chars.each_with_index do |char, idx|
    duped = small.dup
    current_char = char
    current_idx  = idx
    duped.length.times do |i|
      if duped.include?(current_char)
        duped.delete(current_char)
        current_idx += 1
        current_char = large[current_idx]
      else
        break
      end
    end

    if duped.empty?
      found_permuts << large[idx...(idx + small.length)]
    end
  end

  found_permuts
end


a = 'bat'.chars
b = 'tabtbat'

p solution(a, b)
