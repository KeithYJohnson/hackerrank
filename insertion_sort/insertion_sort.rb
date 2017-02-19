
def insertion_sort(array)
  (1...array.length).each do |i|
    value_to_insert = array.delete_at(i)
    insertion_index = i

    while insertion_index > 0 && value_to_insert < array[insertion_index - 1]
      insertion_index -= 1
    end

    array.insert(insertion_index, value_to_insert)
  end
end

a = (1..100).to_a.shuffle
sorted = insertion_sort(a)
p a
