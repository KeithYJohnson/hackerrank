def land_at_same_loc?(kang1_pos, kang1_rate, kang2_pos, kang2_rate)
  p "#{kang1_pos}, #{kang1_rate}, #{kang2_pos}, #{kang2_rate}"
  behind_kang_pos  = [kang1_pos, kang2_pos].min
  ahead_kang_pos   = [kang1_pos, kang2_pos].max

  behind_kang_rate = behind_kang_pos  == kang1_pos ? kang1_rate : kang2_rate
  ahead_kang_rate  = ahead_kang_pos   == kang1_pos ? kang1_rate : kang2_rate

  if behind_kang_rate <= ahead_kang_rate
    puts "NO"
    return
  end

  while behind_kang_pos < ahead_kang_pos
    behind_kang_pos += behind_kang_rate
    ahead_kang_pos  += ahead_kang_rate
    if behind_kang_pos == ahead_kang_pos
      puts "YES"
      return
    end
  end
  puts "NO"
end

# land_at_same_loc?(0, 3, 4, 2)
land_at_same_loc?(43, 2, 70, 2)

# The following recursive solution found here: https://github.com/rootulp/hackerrank/blob/master/ruby/kangaroo.rb
# def same_square?(x1, v1, x2, v2)
#   p "#{x1}, #{v1}, #{x2}, #{v2}"
#   return true if x1 == x2
#   return false if (x1 > x2 && v1 >= v2) || (x1 < x2 && v1 <= v2)
#   same_square?(x1 + v1, v1, x2 + v2, v2)
# end
#
# p same_square?(43, 2, 70, 2)
