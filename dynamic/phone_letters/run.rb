require 'pry-byebug'

NUM_TO_LETTERS = {
  1 => [],
  2 => ['A', 'B', 'C'],
  3 => ['D', 'E', 'F'],
  4 => ['G', 'G', 'I'],
  5 => ['J', 'K', 'L'],
  6 => ['M', 'N', 'O'],
  7 => ['P', 'Q', 'R', 'S'],
  8 => ['T', 'U', 'V'],
  9 => ['W', 'X', 'Y', 'Z'],
  0 => [],
}

def solution(number, permuts=[[]])
  return permuts.select { |permut| permut.length == 7 }.uniq if number.length == 0
  current_num = number.shift.to_i
  num_letters = NUM_TO_LETTERS[current_num]

  permuts.dup.each do |permut|
    num_letters.each do |letter|
      new_permut = permut.dup
      new_permut << letter
      permuts << new_permut
    end
  end

  return solution(number, permuts)
end

number = [2,3,4,5,6,7,8]
permuts = solution(number)
binding.pry
1
