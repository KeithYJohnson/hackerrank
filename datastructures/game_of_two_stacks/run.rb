require 'pry-byebug'
def solution(a, b, limit)
  puts "LIMIT: #{limit}"
  sum         = 0
  last_a_idx  = nil
  num_a_elems = 0

  a.each_with_index do |e, idx|
    if e + sum <= limit
      p "from a adding e: #{e}, idx: #{idx} to sum: #{sum}, result: #{sum + e}, result num_elems: #{num_a_elems + 1}"
      sum         += e
      last_a_idx   = idx
      num_a_elems += 1
    else
      break
    end
  end

  last_b_idx  = nil
  num_b_elems = 0

  b.each_with_index do |e, idx|
    puts ""
    p "from b e + sum attempt e: #{e}, sum: #{sum}, result: #{e + sum}"
    if e + sum <= limit
      p "from b adding e: #{e}, idx: #{idx} to sum: #{sum}, result: #{sum + e}, result num_elems: #{num_b_elems + 1}"
      sum         += e
      last_b_idx   = idx
      num_b_elems += 1
    else
      p "sum - a[last_a_idx] + e attempt: e: #{e}, sum: #{sum}, last_a: #{a[last_a_idx]}, result: #{e + sum - a[last_a_idx]}"
      if sum - a[last_a_idx] + e <= limit
        p "subtracting a's #{a[last_a_idx]} from sum: #{sum} to add from b: #{e}, result: #{sum - a[last_a_idx] + e}"
        sum = sum - a[last_a_idx] + e
        last_b_idx = idx
        last_a_idx  -= 1
        num_a_elems -= 1
        num_b_elems += 1
        p "result a elems: #{num_a_elems}, num_b_elems: #{num_b_elems}, last_a_idx: #{last_a_idx}"
      else
        break
      end
    end
  end

  num_b_elems + num_a_elems
end

# a     = [4, 2, 4, 6, 1]
# b     = [2, 1, 8, 5]
# limit = 10
# input =  File.readlines('input.txt')
# output = File.readlines('output.txt')
#
# input.each_slice(3).with_index do |game, idx|
#   a_length, b_length, limit = game[0].strip.split(' ').map(&:to_i)
#   a = game[1].strip.split(' ').map(&:to_i)
#   b = game[2].strip.split(' ').map(&:to_i)
#
#   unless solution(a,b, limit) == output[idx].strip.to_i
#     binding.pry
#   end
# end
a = [10, 12, 10, 14, 13, 15, 11, 14, 19, 14, 14, 10, 18, 17, 16, 18, 12, 11, 12, 17, 11, 16, 14, 19]
b = [19, 19, 19, 11, 15, 11, 17, 12, 11, 15, 19, 17, 14, 13, 18, 18, 12, 11, 14, 18, 12, 19, 11, 14, 10, 11, 18, 14, 14, 15, 17]
limit = 115
#
p solution(a,b,limit)
# p 'should be 9'

# RobertsN 5 days ago
# "Load" up the maximum quantity of values of A (while not exceeding M) -> This is the initial "solution set".
# add each of the B values to the sum removing the necessary values of A (backwards) keeping within the limit of M as a maximum.
# Keep a running count of how many values are in the "solution set" and display the maximum found of those values.
# Can be solved with: * Simple int array for values of A (or a Stack) * Values of B are simply read off the input stream
# NOTE: Don't forget to remove the unused A and B elements from the input stream.
# If I give any more details I'm just posting the solution :)
# p solution(a,b,limit) == 9
