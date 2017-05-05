require 'pry-byebug'

NUM_TO_LETTERS = {
  1 => [],
  2 => ['A', 'B', 'C'],
  3 => ['D', 'E', 'F'],
  4 => ['G', 'H', 'I'],
  5 => ['J', 'K', 'L'],
  6 => ['M', 'N', 'O'],
  7 => ['P', 'Q', 'R', 'S'],
  8 => ['T', 'U', 'V'],
  9 => ['W', 'X', 'Y', 'Z'],
  0 => [],
}

def solution(number, permuts=[[]], orig_length)
  return permuts.select { |permut| permut.length == orig_length }.uniq if number.length == 0
  current_num = number.shift.to_i
  num_letters = NUM_TO_LETTERS[current_num]

  permuts.dup.each do |permut|
    num_letters.each do |letter|
      new_permut = permut.dup
      new_permut << letter
      permuts << new_permut
    end
  end

  return solution(number, permuts, orig_length)
end

number = [2,3,4]

def iter_solution(number, permuts= [[]], orig_length)
  number.each do |num|
    permuts.dup.each do |permut|

    num_letters = NUM_TO_LETTERS[num]
    num_letters.each do |letter|
        new_permut = permut.dup
        new_permut << letter
        permuts << new_permut
      end
    end
  end
  permuts.select { |permut| permut.length == orig_length }.uniq
end

 # p iter_solution(number, number.length)

# # Tersest solution I found - http://stackoverflow.com/questions/20367357/convert-phone-number-into-words
# https://apidock.com/ruby/Array/product
letters = {"1" => ["1", "1", "1"],
        "2" => ["a", "b", "c"],
        "3" => ["d", "e", "f"],
        "4" => ["g", "h", "i"],
        "5" => ["j", "k", "l"],
        "6" => ["m", "n", "o"],
        "7" => ["p", "q", "r", "s"],
        "8" => ["t", "u", "v"],
        "9" => ["w", "x", "y", "z"]}


digits = '234'
keys = digits.chars.map{|digit|letters[digit]}
p keys.shift.product(*keys).map(&:join) #=> ["ap", "aq", "ar", "as", "bp", "bq", "br", "bs", "cp", "cq", "cr", "cs"]
