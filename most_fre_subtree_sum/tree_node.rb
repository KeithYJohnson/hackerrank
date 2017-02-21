# Definition for a binary tree node.
require 'pry-byebug'
class TreeNode
  attr_accessor :val, :left, :right, :sum_below, :children, :id
  @@current_id = 0

  def initialize(val)
      @@current_id += 1
      self.id        = @@current_id
      self.val       = val
      self.left      = nil
      self.right     = nil
      self.sum_below = val
      self.children  = []
  end

  def sum(node_to_track=self)
    if right
      node_to_track.sum_below += right.val
      right.sum(node_to_track)
    end

    if left
      node_to_track.sum_below += left.val
      left.sum(node_to_track)
    end
  end

  def get_children(node_to_track=self)
    self.children = []
    if left
      node_to_track.children << left
      left.get_children(node_to_track)
    end

    if right
      node_to_track.children << right
      right.get_children(node_to_track)
    end
  end

  def most_frequent_sum_below
    get_children
    sum
    sums = [sum_below]
    children.each do |child|
      child.sum
      sums << child.sum_below
    end

    freqs = sums.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    sums.max_by { |v| freqs[v] }
  end

  def insert(node)
    new_val = node.val
    return if new_val == val

    if new_val > val
      if self.right
        self.right.insert(node)
      else
        self.right = node
      end
    else
      if self.left
        self.left.insert(node)
      else
        self.left = node
      end
    end
  end
end
