def solution(s, permuts=[""])
  return permuts.select{ |p| p.length == 4 }.length if s.empty?

  new_permuts = []
  current_char = s.pop
  permuts.each do |permut|
    (0..permut.length).each do |i|
      duped = permut.dup
      duped.insert(i, current_char)
      new_permuts << duped
    end
  end

  return solution(s, permuts + new_permuts)
end

st = 'abcd'.chars

p solution(st) == 24
