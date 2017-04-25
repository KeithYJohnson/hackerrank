def bf_solution(s)
  permuts = s.chars.permutation(s.length)
  as_words = permuts.map { |permut| permut.join('') }.flatten.uniq.sort
  s_idx = as_words.index(s)
  next_greater = as_words[s_idx + 1]
  next_greater ? next_greater : 'no answer'
end

s = 'hefg'
p bf_solution('ab') == 'ba'
p bf_solution('bb') == 'no answer'
p bf_solution(s) == 'hegf'
p bf_solution('dhck') == 'dhkc'
p bf_solution('dkhc') == 'hcdk'
