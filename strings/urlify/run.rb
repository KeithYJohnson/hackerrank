def solution(s)
  (s.length - 1).times do |idx|
    if s[idx] == ' '
      s[idx] = '%20'
    end
  end

  s
end

s = 'mr john smith'
p solution(s)
