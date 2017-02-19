def insertion_sort(array)
  (1..array.length-1).each do |i|
    value_to_insert = array.delete_at(i)

    insertion_index = i
    insertion_index -= 1 while insertion_index > 0 && value_to_insert < array[insertion_index -1]

    array.insert(insertion_index, value_to_insert)
  end

  array
end

a = (1..100).to_a.shuffle
sorted = insertion_sort(a)
p sorted
