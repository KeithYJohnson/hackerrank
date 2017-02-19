require 'pry-byebug'

class BreadthFirstSearch
  attr_accessor :tree, :target
  @@current_level = 0
  @@not_found     = true

  def initialize(tree, target)
    self.tree = tree
    self.target = target
  end

  def perform
    root = tree.root
    return "found target: #{target} at root" if root.value == target

    children = [root.left, root.right]
    search_level(children)
  end

  def search_level(nodes)
    @@current_level += 1
    puts "searching level: #{@@current_level}"

    next_level = []
    nodes.each do |node|
      next_level = node.next_level
      search_node(node, target)
    end
    search_level(next_level.flatten) if @@not_found && !next_level.compact.empty?
  end

  def search_node(node, target)
    if node && node.value == target
      puts "Found target: #{target} at node: #{node}, node.value #{node.value}"
      @@not_found = false
    end
  end
end
