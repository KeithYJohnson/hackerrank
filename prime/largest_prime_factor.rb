require 'prime'

starting_num     = 600_851_475_143.0
current_divisor  = 3 # Its first factor.
current_quotient = starting_num / current_divisor


while current_quotient > 1
  current_divisor += 1
  current_quotient = starting_num / current_divisor
  if current_quotient % 1 == 0.0 && Prime.prime?(current_quotient.to_i)
    puts current_quotient.to_i
    return
  end
end
