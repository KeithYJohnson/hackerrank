require 'pry-byebug'
def bf_solution(arr, operations)
  operations.each do |operation|
    a, b, k = operation

    a.upto(b) do |idx|
      arr[idx - 1] += k
    end
  end
  arr.max
end

p bf_solution(arr, operations)

# found a faster solution on the discusion forums here: https://www.hackerrank.com/challenges/crush/forum
# This is it below

# N, M = gets.chomp.split(' ').map(&:to_i)
#
# # create array of zeros of length N + 1
# arr = Array.new(N + 1, 0)
#
# M.times do
#     # cycle through and get the inputs
#     start, finish, value = gets.chomp.split(' ').map(&:to_i)
#
#     # increment value at start of sequence
#     arr[start - 1] += value
#
#     # decrement value at first position after sequence
#     arr[finish] -= value
# end
#
# tmp = 0
# max = 0
#
# arr.each do |value|
#     # step through summing array
#     tmp += value
#
#     # capture the max value of tmp
#     max = tmp if max < tmp
# end
#
# puts max


# some explanation about how this works


# amitkumarjnv2 2 years ago
# see, you are adding sum to a[p] and adding negative sum at a[q+1]. which make sure that when you add element from a[p] to a[q] sum is added only once and it should be subtracted at a[q+1] as this sum span from p to q only. Rest array element are either 0 or some other input sum. max of addition will be output. refer to above code for p, q, and sum.
# 10  | Add Comment Parent Permalink
#
# lancerchao about a year ago
# Instead of storing the actual values in the array, you store the difference between the current element and the previous element. So you add sum to a[p] showing that a[p] is greater than its previous element by sum. You subtract sum from a[q+1] to show that a[q+1] is less than a[q] by sum (since a[q] was the last element that was added to sum). By the end of all this, you have an array that shows the difference between every successive element. By adding all the positive differences, you get the value of the maximum element
