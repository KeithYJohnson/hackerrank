class TreeNode
  attr_accessor :val, :left, :right, :sum_below, :children, :id, :levels
  @@current_id = 0

  def initialize(val)
      @@current_id += 1
      self.id        = @@current_id
      self.val       = val
      self.left      = nil
      self.right     = nil
      self.sum_below = val
      self.children  = []
      self.levels    = []
  end

  def invert
    get_levels
    levels.each_with_index do |level, l_idx|
      if l_idx == 0
        left_placeholder = self.left
        self.left        = self.right
        self.right       = left_placeholder
        next
      else
        previous_level = levels[l_idx - 1]
      end

      level.each_slice(2).with_index do |node_pair, pair_index|
        parent = previous_level[pair_index]
        parent.left = node_pair.last
        parent.right  = node_pair.first
      end
      # TODO If you manually traverse to the leaves, they are inverted.  This
      # means the self.levels needs to be able to be rebuilt.
    end
  end

  def get_levels(nodes=[self])
    next_level = []

    nodes.each do |node|
      next if node.nil?
      next_level << node.left
      next_level << node.right
    end

    unless next_level.all? { |node| node.nil? }
      self.levels << next_level
      get_levels(next_level)
    end
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

  def search(target)
    if target < self.val
      self.left.search(target) if self.left
    elsif target > self.val
      self.right.search(target) if self.right
    else
      return self
    end
  end
end
