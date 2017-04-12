
def solution(w)
  vowel_set = %w(a e i o u y)
  w.chars.each_with_index do |char, index|
    next if index == 0
    previous_letter = w[index-1]
    if previous_letter == char || (vowel_set.include?(previous_letter) && vowel_set.include?(char))
      puts "No"
      return
    end
  end
  puts "Yes"
end

solution('batman')
solution('apple')
