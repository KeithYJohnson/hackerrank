# https://projecteuler.net/problem=6
# The sum of the squares of the first ten natural numbers is,
#
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

sum_of_squares    = (1..100).to_a.inject { |sum, n| sum + n ** 2 }
square_of_the_sum = (1..100).to_a.inject(:+) ** 2


puts "sum_of_squares:     #{sum_of_squares}"
puts "square_of_the_sum:  #{square_of_the_sum}"
puts square_of_the_sum - sum_of_squares
