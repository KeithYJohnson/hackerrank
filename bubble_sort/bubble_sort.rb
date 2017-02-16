require 'pry-byebug'

def bubble_sort(array, iteration = 0)
  print("running iteration #{iteration}")
  p array
  did_swap = false
  array.each_with_index do |_, index|
    a = array[index]
    b = array[index + 1]
    if a && b
      if a > b
        array[index]      = b
        array[index + 1]  = a
        did_swap = true
      end
    else
      if did_swap
        bubble_sort(array, iteration + 1)
      end
    end
  end
end


a = (1..10).to_a.shuffle!
p "starting a"
p a
bubble_sort(a)
