require 'set'
require 'pry-byebug'

def solution(set, subsets=[Set.new])
  return subsets if subsets.last.length == set.length
  new_subsets = []

  set.each do |member|
    subsets.each do |ss|
      new_set = ss.dup
      new_set << member
      new_subsets << new_set
    end
  end

  new_subsets.each do |new_ss|
    unless subsets.include?(new_ss)
      subsets << new_ss
    end
  end

  return solution(set, subsets)
end

p solution(Set.new([1,2,3,4]))

# {}
# {1}
# {2}
# {3}
# {1,2}
# {1,3}
# {2,3}
# {1,2,3}
