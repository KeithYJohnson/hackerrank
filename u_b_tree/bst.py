class Node(object):
    def __init__(self, value):
        self.value = value
        self.left  = None
        self.right = None

class BST(object):
    def __init__(self, root):
        self.root = Node(root)

    def insert(self, new_val):
        current_node = self.root
        while current_node:
            if new_val > current_node.value:
                if current_node.right:
                    current_node = current_node.right
                else:
                    current_node.right = Node(new_val)
                    break
            else:
                if current_node.left:
                    current_node = current_node.left
                else:
                    current_node.left = Node(new_val)
                    break


    def search(self, find_val):
        current_node = self.root
        while current_node:
            if find_val > current_node.value:
                current_node = current_node.right
            elif find_val < current_node.value:
                current_node = current_node.left
            else:
                return True

        return False

# Set up tree
tree = BST(4)

# Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(5)

# Check search
# Should be True
print(tree.search(4))
# Should be False
print(tree.search(6))
