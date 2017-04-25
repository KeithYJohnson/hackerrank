# https://www.hackerrank.com/challenges/encryption

def solution(s)
  sqrt = Math.sqrt(s.length)

  num_rows   = sqrt.floor
  num_cols   = sqrt.ceil

  cols = Array.new(num_cols) { [] }

  s.chars.each_with_index do |char, idx|
    col_idx = idx % cols.length
    cols[col_idx] << char
  end

  # binding.pry
  cols.each { |c| print c.join('') + ' ' }
end

s = 'if man was meant to stay on the ground god would have given us roots'.gsub!(' ','')
solution(s)
