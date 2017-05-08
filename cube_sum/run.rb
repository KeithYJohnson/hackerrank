#Finding all pairs where a**3 + b**3 == c**3 + d**3
def cube_sum(n)
  results = Hash.new { |h, k| h[k] = [] }

  (1..1_000).each do |a|
    (1..1_000).each do |b|
      result = a ** 3 + b ** 3
      results[result] << [a,b].sort unless results[result].include?([a,b].sort)
    end
  end

  results.each do |k,v|
    # No result has more than two items.
    if results[k].length > 1
      p results[k]
    end
  end
  nil
end

p cube_sum(1_000)
