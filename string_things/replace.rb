def replace(text, match, replace)
  text.gsub(match, replace)
end


p replace("hithere", "hi", "hey")
