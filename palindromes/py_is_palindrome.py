def is_palindrome(text):
    if len(text) == 1 or len(text) == 0:
        return True
    else:
        if text[0] != text[-1]:
            return False
        return is_palindrome(text[1:-1])

print(is_palindrome('hi'))
print(is_palindrome('dad'))
print(is_palindrome(''))
print(is_palindrome('a'))
print(is_palindrome('racecar'))
print(is_palindrome('asdfasdfracecar'))
