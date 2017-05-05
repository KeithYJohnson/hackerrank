require 'pry-byebug'
require './node'
require './linked_list'

class LRUCache
  attr_accessor :capacity, :cache, :list

  def initialize(capacity=5)
    self.capacity = capacity
    self.cache = {}
    self.list  = LinkedList.new
  end

  def get(key)
    node = cache[key]
    if node
      # Remove the node from its current position in linked list
      prev_node = node.prev
      next_node = node.next

      prev_node.next = next_node if prev_node

      # Add it to the end of the list
      # The tail represents the most recently accessed item
      list.add(node)

      node.val
    end
  end

  def set(key, value)
    if cache.size >= capacity
      least = least_recently_used
      list.head = least.next
      cache.delete(least.key)
    end

    node       = list.add(value)
    node.key   = key
    cache[key] = node
    node.val
  end

  def least_recently_used
    list.head
  end
end

# Quick tests
# c = LRUCache.new
#
# c.set('hi',      'friend')
# c.set('hola',    'amigo')
# c.set('hallo',   'freund')
# c.set('buna',    'prieten')
# c.set('sawubona','umngane')
# c.set('privet',  'droog')
#
# p c.get('hi')     == nil
# p c.get('hola')   == 'amigo'
# p c.list.tail.val == 'amigo'
