# https://www.hackerrank.com/challenges/non-divisible-subset

def bf_solution(k, a)
  max_size = 0
  2.upto(a.length) do |i|
    a.combination(i) do |combo|
      result = combo.combination(2).all? do |subc|
        subc.inject(:+) % k != 0
      end

      if result
        max_size = combo.length if combo.length > max_size
      end
    end
  end

  max_size
end

k = 3
a = %w(1 7 2 4).map(&:to_i)

# p bf_solution(k, a)

#First wrong
# I
# a = %w(1 1).map(&:to_i)
# k = 1
# output = bf_solution(k, a)
# p output
# p output == 1
#O
# 1

#Second wrong
# 5 1
a = %w(1 2 3 4 5).map(&:to_i)
output = bf_solution(1, a)
p output
p output == 1
# output
# 1
