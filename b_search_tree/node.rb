class Node
  attr_accessor :left, :right, :value, :id
  @@current_id = 1

  def initialize(value, left=nil, right=nil)
    self.id    = @@current_id
    self.value = value
    self.left  = left
    self.right = right
    @@current_id += 1
  end
end
