# https://www.hackerrank.com/challenges/pascals-triangle
# For a given integer , print the first  rows of Pascal's Triangle.
# Print each row with each value separated by a single space. The
# value at the nth row and  rth column of the triangle is equal to
  # n! / (r! * (n-r)!)
#where indexing starts from 0. These values are the binomial coefficients.

def solution(limit, current=0)
  return if current == limit
  as_array = Array.new(current + 1)

  as_array.map!.with_index do |e, idx|
    factorial(current) / (factorial(idx) * factorial(current-idx))
  end
  as_string = as_array.join(' ')
  puts as_string
  solution(limit, current + 1)
end

def factorial(n)
  (1..n).inject(:*) || 1
end

solution(4)
# 1
# 1 1
# 1 2 1
# 1 3 3 1

solution(10)
