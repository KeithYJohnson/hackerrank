def solution(s)
  s.split(/\s+/).inject(Hash.new(0)) do |hash, word|
    word = word.downcase.gsub(/[^a-z0-9\s]/i, '')
    hash[word] += 1
    hash
  end
end
# Current adds dont current, but adds boys to hash as if it were plural.
s = "Add milk-and-eggs, don't boy's then add flour and sugar."
p solution(s)
