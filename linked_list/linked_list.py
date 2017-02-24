class Element:
    def __init__(self, value, next=None):
        self.value = value
        self.next  = next


class LinkedList:
    def __init__(self, head):
        self.head   = head

    def append(self, element):
        current_elem = self.head

        if self.head:
            while current_elem.next:
                current_elem = current_elem.next

            current_elem.next = element
        else:
            print('No head element, making appended element the head element')
            self.head = element

    def get_elem_by_position(self, position):
        current = self.head
        # We're 1-indexing and self.head is at position 1.
        for i in range(2, position + 1):
            next_elem = current.next
            if next_elem:
                current = next_elem
            else:
                return None

        return current

    def insert(self, new_element, position):
        current = self.head
        after_node  = self.get_elem_by_position(position)
        before_node = self.get_elem_by_position(position - 1)

        new_element.next = after_node
        before_node.next = new_element
        return new_element


    def delete(self, value):
        """Delete the first node with a given value."""
        current = self.head

        while current and current.value != value:
            current = current.next

        if current:
            after_node        = current.next
            previous_position = self.get_position_by_element(current)[1] - 1
            previous_node     = self.get_elem_by_position(previous_position)
            previous_node.next = after_node
        else:
            print('Value not found, did not delete anything from the LinkedList.')

    def get_position_by_element(self, element):
        current = self.head
        current_position = 1 # 1-indexed
        while current and current != element:
            current_position += 1
            current           = current.next

        return current, current_position

    def get_elem_by_value(self, value):
        current = self.head
        while current and current.value != value:
            current = current.next

        return current

e  = Element(3)
ll = LinkedList(e)
e2 = Element(4)
e3 = Element(5)
ll.append(e2)
ll.append(e3)

print(e.next.next == e3)
print(ll.get_elem_by_position(2))
ll.insert(Element(10), 3)
print( ll.get_elem_by_position(3).value == 10 )
print(ll.get_elem_by_position(4).value == 5)
print(ll.get_elem_by_position(2).value == 4)

# Testing delete.
print(ll.delete(5))
print(ll.get_elem_by_value(5) == None)
