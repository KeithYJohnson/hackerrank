require 'set'
require 'pry-byebug'
def solution(a)
  sets = [[]]

  loop do
    duped = sets.dup
    a.each do |e|
      duped.each do |set|
        new_set = Set.new(set)
        new_set << e
        sets << new_set

        if new_set.length == a.length
          return sets.uniq
        end
      end
    end
  end
end

a = [3,2,1]
# 3-2-1
# 3-2
# 2-3
# 3-1
# 3
# 2
# 1
# []
p solution(a)
