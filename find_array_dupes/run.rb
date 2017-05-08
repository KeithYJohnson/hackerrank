require 'set'
def solution(a)
  seen = Set.new([])
  until a.empty?
    current = a.pop
    if seen.member?(current)
      return current
    else
      seen << current
    end
  end

  'no dupes found'
end

a = (1..100).to_a.shuffle
p solution(a) == 'no dupes found'

a = (1..100).to_a.shuffle << 5
p solution(a) == 5
