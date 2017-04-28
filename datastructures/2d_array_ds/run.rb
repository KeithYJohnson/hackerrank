# https://www.hackerrank.com/challenges/2d-array
OFFSETS = [
  [0,0],
  [0,1],
  [0,2],
  [1,1],
  [2,0],
  [2,1],
  [2,2]
]

def solution(a)
  max = -9 * a.length * a[0].length
  
  (0).upto(a.length - 3) do |row_idx|
    row = a[row_idx]
    0.upto(row.length - 3) do |col_idx|
      elem = row[col_idx]
      sum = 0
      OFFSETS.each do |offset|
        y, x = offset
        sum += a[row_idx + y][col_idx + x]
      end
      max = sum if sum > max
    end
  end
  max
end

a = [[1, 1, 1, 0, 0, 0], [0, 1, 0, 0, 0, 0], [1, 1, 1, 0, 0, 0], [0, 9, 2, -4, -4, 0], [0, 0, 0, -2, 0, 0], [0, 0, -1, -2, -4, 0]]
p solution(a)
