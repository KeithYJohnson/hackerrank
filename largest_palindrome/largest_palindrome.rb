def is_palindrome?(num)
    num == num.to_s.reverse.to_i
end

max_palindrome = 0
999.downto(100) do |i|
  999.downto(100) do |j|
    product = i * j
    max_palindrome = product if is_palindrome?(product) && product > max_palindrome
  end
end
p max_palindrome
