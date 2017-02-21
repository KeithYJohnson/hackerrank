def is_palindrome(text)
  if text.length == 1 || text.length == 0
    return true
  else
    return false if text[0] != text[-1]
    is_palindrome(text[1...-1])
  end
end


puts is_palindrome('hi')
puts is_palindrome('dad')
puts is_palindrome('')
puts is_palindrome('a')
puts is_palindrome('racecar')
puts is_palindrome('asdfasdfracecar')
