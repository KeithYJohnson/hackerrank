def replace(text, match, replace)
  text.gsub(match, replace)
end

def has_balanced_brackets(string)
  # If the string contains no brackets
  brackets = string.scan(/[\[,\]]/)
  array_of_balance_brackets(brackets)
end

def array_of_balance_brackets(array)
  if array.length == 0
    return true
  else
    if array[0] == "[" and array[-1] == "]"
      array_of_balance_brackets(array[1...-1])
    else
      return false
    end
  end
end

# p has_balanced_brackets('theread]f')
p has_balanced_brackets("hi[dafsd]")
p has_balanced_brackets("sadfasdf[")
p has_balanced_brackets("]sadfasdf")
p has_balanced_brackets("]sadfasdf[")
p has_balanced_brackets("[ad[fa]sdf]")
