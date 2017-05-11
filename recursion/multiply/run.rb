def solution(a, b, current=0, sum=0)
  return sum if current == a

  sum     += b
  current += 1
  solution(a, b, current, sum)
end


p solution(10,3)
