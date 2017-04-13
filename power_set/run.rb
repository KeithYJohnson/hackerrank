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

# p solution(Set.new([1,2,3,4]))

# {}
# {1
# {2}
# {3}
# {1,2}
# {1,3}
# {2,3}
# {1,2,3}

# From http://stackoverflow.com/questions/2779094/what-algorithm-can-calculate-the-power-set-of-a-given-set
# The best ruby solution I've found.
def powerset(set)
  p "set: #{set}"
  return [set] if set.empty?

  member = set.pop
  "member: #{member}"
  subset = powerset(set)
  p "subset: #{subset}"

  # https://docs.ruby-lang.org/en/2.0.0/Array.html#method-i-7C
  # ary | other_ary → new_ary
  # Set Union — Returns a new array by joining ary with other_ary, excluding any duplicates and preserving the order from the original array.
  # It compares elements using their hash and eql? methods for efficiency.
  subset | subset.map do |x|
    p "x: #{x}, member: #{member}"
    thing = x | [member]
    p "thing after pipe #{thing}"
    thing
  end
end

p powerset([1,2,3])

# powerset([1,2,3])
# member = 3
#   powerset([1,2])
#   member = 2
#     powerset([1])
#     member = 1
#       powerset([])
#       => [[]]
#
#     [[]] | [1]
#       # => [[],[1]]
#   [[],[1]].map {|x| x | [member] }
#     # => [[2]]
#     # => [[1,2]]
#   subset = [[],[1],[2],[1,2]]

# [[],[1],[2],[1,2]].map { |x| x | member }
#   => [3]
#   => [1,3]
#   => [2,3]
#   => [1,2,3]
