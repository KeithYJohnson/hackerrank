class TreeBuilder
  attr_accessor :counter, :a

  def initialize
    self.counter = 0
    self.a = (1..100).to_a
  end

  def build_tree(root_node)
    while counter < 1_000 do
      left_node = Node.new(a.sample)
      right_node = Node.new(a.sample)

      root_node.left  = left_node
      root_node.right = right_node

      self.counter += 1

      random = rand(0..1)
      # Without randomness it just builds a tree of left nodes.
      if random == 1
        build_tree(left_node)
      else
        build_tree(right_node)
      end
    end
  end
end
