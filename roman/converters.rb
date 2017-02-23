require 'pry-byebug'
def roman_to_int(roman_num, value=0)
  map = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1_000
  }

  roman_num.each_char.with_index do |char, index|
    char_as_int        = map[char.to_sym]

    unless index + 2 > roman_num.length
      next_char_as_int   = map[roman_num[index + 1].to_sym]
    else
      # At the end of the string
      value += char_as_int
      return value
    end


    if next_char_as_int > char_as_int
      value -= char_as_int
    else
      value += char_as_int
    end
  end
end

p roman_to_int('XIV')
p roman_to_int('MD')
p roman_to_int('M')
p roman_to_int('IV')
p roman_to_int('III')
