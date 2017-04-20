def hits(fruits, house_start, house_end, tree_pos)
  num_falling_on_house = 0
  fruits.each do |distance|
    fall_pos = tree_pos + distance
    num_falling_on_house += 1 if fall_pos.between?(house_start, house_end)
  end

  puts num_falling_on_house
end
