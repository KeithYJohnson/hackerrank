require 'pry-byebug'

class BreadthFirstSearch
  attr_accessor :tree, :target, :not_found

  def initialize(tree, target)
    self.tree = tree
    self.target = target
    self.not_found = true
  end

  def perform
    root = tree.root
    return "found target: #{target} at root" if root.value == target

    search_node(root.left, target)
    search_node(root.right, target)
  end

  def search_node(node, target)
    while not_found
      if node && node.value == target
        puts "Found target: #{target} at node: #{node}, node.value #{node.value}"
        not_found = false
      end

      search_node(node.left, target)  if node.left
      search_node(node.right, target) if node.right
    end
  end
end
