class Bsearch

  attr_accessor :array, :target, :offset

  def initialize(array, target, offset=0)
    self.array  = array
    self.target = target
    self.offset = offset
  end

  def perform
    middle = array.length / 2
    value = array[middle]

    if value == target
      raise "found target: #{target}, at index #{middle + offset}"
    end

    if array.length == 1
      raise "target: #{target} not found"
    end

    first_half  = array[0..(middle - 1)]
    second_half = array[(middle + 1)..-1]


    if value > target
      action = Bsearch.new(first_half, target, offset)
      action.perform
    else
      action = Bsearch.new(second_half, target, (first_half.length + offset + 1))
      action.perform
    end
  end
end

arr = (1..100000).to_a
action = Bsearch.new(arr, 5000)
action.perform
