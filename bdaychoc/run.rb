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

p solution(a, d, m)
