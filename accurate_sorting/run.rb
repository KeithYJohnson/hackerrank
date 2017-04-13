 # https://www.hackerrank.com/contests/w31/challenges/accurate-sorting
# q = gets.strip.to_i
# for a0 in (0..q-1)
#     n = gets.strip.to_i
#     a = gets.strip
#     a = a.split(' ').map(&:to_i)
      # fast_swap_sort(a)
#     # Write Your Code Here
# end

def fast_swap_sort(arr)
  (arr.length - 1).times do |idx|
    a = arr[idx]
    b = arr[idx + 1]

    if (a - idx) > 1
      puts "No"
      return
    end
  end
  puts "Yes"
end

a1 = %w(1 0 3 2).map(&:to_i)
a2 = %w(2 1 0).map(&:to_i)

fast_swap_sort(a1) # Yes
fast_swap_sort(a2) # No

a3 = %w(0 1 2 3).map(&:to_i)

fast_swap_sort(a3) # Yes
