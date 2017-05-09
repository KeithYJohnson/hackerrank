#Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
# p 102
require 'set'
def solution(s)
  set = Set.new([])
  s.each_char do |char|
    if set.member?(char)
      return false
    else
      set << char
    end
  end
  true
end

#No additional data structures
def solution_no_ds_bf(s)
  s.each_char.with_index do |a, aidx|
    s[0...aidx].each_char do |b|
      return false if a == b
    end
  end
  true
end

p solution_no_ds('acb')
