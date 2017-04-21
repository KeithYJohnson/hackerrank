# https://www.hackerrank.com/challenges/the-birthday-bar?h_r=next-challenge&h_v=zen

def solution(a, day, month)
  count = 0

  a.each_cons(month) do |suba|
    count += 1 if suba.inject(:+) == day
  end
  count
end


a = [1, 2, 1, 3, 2]
d = 3
m = 2

# p solution(a, d, m)

def recursive(a, day, month, current_idx=0, count=0)
  return count if current_idx == a.length - month + 1
  subarray = a[current_idx...(current_idx + month)]
  if subarray.inject(:+) == day
    count += 1
  end

  return recursive(a, day, month, current_idx + 1, count)
end

# p recursive(a, d, m)

a = %w(2 5 1 3 4 4 3 5 1 1 2 1 4 1 3 3 4 2 1).map(&:to_i)
d = 18
m = 7

puts recursive(a, d, m) == 3
