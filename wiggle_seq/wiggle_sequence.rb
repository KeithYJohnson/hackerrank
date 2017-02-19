class WiggleSequence
  attr_accessor :array, :max_wiggle_size, :wiggle_array

  MIN_NUM_OF_WIGGLES = 1

  def initialize(array)
    self.array = array
    self.wiggle_array = []
    self.max_wiggle_size = MIN_NUM_OF_WIGGLES
  end

  def perform
    array.each_cons(2) do |a,b|
      diff = b - a

      if wiggle_array.empty?
        self.wiggle_array << diff
        next
      end

      last = wiggle_array[-1]

      diff_sign = diff <=> 0
      last_sign = last <=> 0

      if diff_sign != last_sign
        self.wiggle_array << diff
        self.max_wiggle_size = wiggle_array.length if wiggle_array.length > max_wiggle_size
      else
        wiggle_array = []
      end
    end

    max_wiggle_size + 1
  end
end
