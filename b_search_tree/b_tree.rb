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

root = Node.new(0)

builder = TreeBuilder.new
builder.build_tree(root)
tree    = BTree.new(root)
target = tree.root.left.value
searcher = BreadthFirstSearch.new(tree, target)
searcher.perform
