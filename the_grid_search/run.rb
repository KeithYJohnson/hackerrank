# https://www.hackerrank.com/challenges/the-grid-search
require 'pry-byebug'
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

def fast_grid_match?(grid, pattern)

  num_pattern_rows    = pattern.length
  num_pattern_cols = pattern[0].length
  smushed_pattern     = pattern.join

  num_snapshots = (grid.length - num_pattern_rows) * (grid[0].length - num_pattern_cols)
  snapshots     = Array.new(grid.length - num_pattern_rows + 1) { Array.new(grid[0].length - num_pattern_cols + 1) { "" } }

  grid.each_with_index do |row, row_idx|
    row.chars.each_with_index do |char, col_idx|
      low_row_idx  = [row_idx - num_pattern_rows + 1, 0].max
      high_row_idx = [grid.length - num_pattern_rows, row_idx].min

      low_col_idx  = [col_idx - num_pattern_cols - 1, 0].max
      high_col_idx = [grid[0].length - num_pattern_cols, col_idx].min

      (low_row_idx..high_row_idx).each do |snapshot_row_idx|
        (low_col_idx..high_col_idx).each do |snapshot_col_idx|
          snapshots[snapshot_row_idx][snapshot_col_idx] += char
        end
      end
    end
  end
  snapshots.flatten.map(&:length).uniq
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
