def rekkids_brokens(a)
  # min and max are based off constraints in problem description
  min = 100_000_001
  max = -1
  num_new_min = 0
  num_new_max = 0

  a.each do |e|
    if e > max
      max = e
      num_new_max += 1
      # break
    end

    if e < min
      min = e
      num_new_min += 1
    end
  end

  # subtracting 1 because this algo counts the first score as both a
  # new high and low which technically it is, but the grader doesnt
  # like that.
  puts "#{num_new_max - 1} #{num_new_min - 1}"
end

# rekkids_brokens([10, 5, 20, 20, 4, 5, 2, 25, 1])

rekkids_brokens([100_000_000, 100_000_000, 10_000_000, 10_000_000, 1_000_000])
