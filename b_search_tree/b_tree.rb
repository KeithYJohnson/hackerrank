require './node'
require './tree_builder'
require './breadth_first_search'
require 'pry-byebug'

class BTree
  attr_accessor :root

  @@not_found = true
  @@iters     = 0

  def initialize(root_node)
    self.root = root_node
  end

  def lookup(target, node=nil)
    if @@iters == 0 && node.nil?
      current_node = root
    else
      current_node = node
    end

    if @@not_found
      @@iters += 1
      if current_node.value == target
        @@not_found = false
        puts "found target: #{target} at Node with id: #{current_node.id}"
        return current_node.id
      elsif current_node.value > target
        lookup(target, current_node.left)
      else
        lookup(target, current_node.right)
      end
    end
  end
end

# root = Node.new(0)
# builder = TreeBuilder.new
# builder.build_tree(root)
# tree    = BTree.new(root)
# target = tree.root.left.value
