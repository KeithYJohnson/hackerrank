require './node'

class LinkedList
  attr_accessor :head, :tail

  def add(val)
    node = if val.class == Node
      val
    else
      Node.new(val)
    end

    node.list = self

    if !head && !tail
      self.head = node
      self.tail = node
    else
      self.tail.next = node
      self.tail = node
    end


    node
  end
end


# Quick tests
# ll = LinkedList.new
#
# ll.add(3)
#
# p ll.head.val == 3
# p ll.tail.val == 3
# ll.add(4)
#
# p ll.head.val == 3
# p ll.tail.val == 4
# p ll.head.next.val == 4
# p ll.tail.next == nil
#
# ll.add(5)
# p ll.head.val == 3
# p ll.tail.val == 5
# p ll.head.next.next.val == 5
