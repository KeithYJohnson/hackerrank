def land_at_same_loc?(kang1_pos, kang1_rate, kang2_pos, kang2_rate)
  behind_kang_pos  = [kang1_pos, kang2_pos].min
  ahead_kang_pos   = [kang1_pos, kang2_pos].max

  behind_kang_rate = behind_kang_pos  == kang1_pos ? kang1_rate : kang2_rate
  ahead_kang_rate  = ahead_kang_pos   == kang1_pos ? kang1_rate : kang2_rate

  if behind_kang_rate < ahead_kang_rate
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

land_at_same_loc?(0, 3, 4, 2)
