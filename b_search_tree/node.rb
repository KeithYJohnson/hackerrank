class Node
  attr_accessor :left, :right, :value

  def initialize(value, left=nil, right=nil)
    self.value = value
    self.left = left
    self.right = right
  end
end
