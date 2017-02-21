def intersection(a, b)
  in_both = []
  a.each do |a_elem|
    b.each do |b_elem|
      if a_elem == b_elem
        in_both << a_elem
      end
    end
  end
  in_both.uniq
end

def union(a, b)
  placeholder = a + b
  placeholder.uniq
end

p union([1,2],[2,3])
p intersection([1,2],[2,3])
p intersection([1,2,3],[2,3,4])
