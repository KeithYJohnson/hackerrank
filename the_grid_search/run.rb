# https://www.hackerrank.com/challenges/the-grid-search
# Faster ruby solution - https://github.com/rootulp/hackerrank/blob/master/ruby/the_grid_search.rb
def grid_match?(grid, pattern)
  num_pattern_rows    = pattern.length
  num_pattern_columns = pattern[0].length
  smushed_pattern     = pattern.join

  grid.each_cons(num_pattern_rows) do |rows|
    grid_snapshot = ""
    start_col = 0
    end_col   = num_pattern_columns - 1

    while end_col < grid[0].length
      rows.each do |row|
        substring = row[start_col..end_col]
        grid_snapshot << substring
      end

      if grid_snapshot == smushed_pattern
        return "YES"
      end

      start_col += 1
      end_col += 1
      grid_snapshot = ""
    end
  end
  "NO"
end


# grid = ["7283455864", "6731158619", "8988242643", "3830589324", "2229505813", "5633845374", "6473530293", "7053106601", "0834282956", "4607924137"]
# pattern = ["9505", "3845", "3530"]
#
# puts grid_match?(grid, pattern)
#
grid = ["400453592126560", "114213133098692", "474386082879648", "522356951189169", "887109450487496", "252802633388782", "502771484966748", "075975207693780", "511799789562806", "404007454272504", "549043809916080", "962410809534811", "445893523733475", "768705303214174", "650629270887160"]
pattern = ["99", "99"]
p fast_grid_match?(grid, pattern)

# grid    = Array.new(9) { (1..9).to_a }
# pattern = Array.new(3) { (1..3).to_a }
#
# grid_match?(grid, pattern)
