# https://www.hackerrank.com/challenges/extra-long-factorials

def solution(n)
  a = (1..n).to_a.inject(:*)
end

p solution(25)
