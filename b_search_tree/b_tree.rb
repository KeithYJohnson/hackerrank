require './node'
require './tree_builder'
require './breadth_first_search'
require 'pry-byebug'

class BTree
  attr_accessor :root

  def initialize(root_node)
    self.root = root_node
  end
end

# root = Node.new(0)
# builder = TreeBuilder.new
# builder.build_tree(root)
# tree    = BTree.new(root)
# target = tree.root.left.value


# A test case becasue TreeBuilder is random
root = Node.new(5)

#1st level
first_left  = Node.new(3)
first_right = Node.new(10)
root.left   = first_left
root.right  = first_right

# SECOND LEVEL
# Left Nodes
left_left  = Node.new(1)
left_right = Node.new(4)
first_left.left = left_left
first_left.right = left_right

#Right nodes
right_left = Node.new(7)
right_right = Node.new(12)
first_right.left = right_left
first_right.right = right_right

tree = BTree.new(root)
target = 10
searcher = BreadthFirstSearch.new(tree, target)
searcher.perform
