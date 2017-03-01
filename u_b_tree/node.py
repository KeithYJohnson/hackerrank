class Node(object):
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BinaryTree(object):
    def __init__(self, root):
        self.root = Node(root)

    def search(self, find_val):
        nodes_to_search = [self.root.left, self.root.right]
        while len(nodes_to_search) > 0:
            next_level = []
            for node in nodes_to_search:
                if node.value == find_val:
                    return True
                else:
                    next_level.append(node.left)
                    next_level.append(node.right)

            nodes_to_search = list(filter(None, next_level))

        return False


    def print_tree(self):
        return self.preorder_print(self.root, "")[:-1]



    def preorder_search(self, start, find_val):
        if start:
            if start.value == find_val:
                return True
            else:
                self.preorder_search(start.left)
                self.preorder_search(start.right)
        return False


    def preorder_print(self, start, traversal):
        if start:
            traversal += (str(start.value) + "-")
            traversal = self.preorder_print(start.left, traversal)
            traversal = self.preorder_print(start.right, traversal)
        return traversal

# Set up tree
tree = BinaryTree(1)
tree.root.left = Node(2)
tree.root.right = Node(3)
tree.root.left.left = Node(4)
tree.root.left.right = Node(5)

# Test search
# Should be True
print(tree.search(4))
# Should be False
print(tree.search(6))

# Test print_tree
# Should be 1-2-4-5-3
print(tree.print_tree())
