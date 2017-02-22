
def roman_to_int(roman_num, value=0)
  map = {
    "I": 1,
    "V": 5,
    "X": 10
  }

  roman_num.each_char.with_index do |char, index|
    char_as_int        = map[char.to_sym]

    unless index + 2 > roman_num.length
      next_char_as_int   = map[roman_num[index + 1].to_sym]
    else
      value += char_as_int
      p value
      return
    end

    if index == 0
      value += char_as_int
      next
    end

    if next_char_as_int > char_as_int
      value -= char_as_int
    else
      value += char_as_int
    end

  end
end

roman_to_int('XIV')
