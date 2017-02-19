require './b_tree'
require './node'

describe BTree do
  let(:right_right) { Node.new(12) }
  let(:tree) do
    root = Node.new(5)

    #1st level
    first_left  = Node.new(3)
    first_right = Node.new(10)
    root.left   = first_left
    root.right  = first_right

    # SECOND LEVEL
    # Left Nodes
    left_left  = Node.new(1)
    left_right = Node.new(4)
    first_left.left = left_left
    first_left.right = left_right

    #Right nodes
    right_left = Node.new(7)
    first_right.left = right_left
    first_right.right = right_right

    described_class.new(root)
  end

  describe "#lookup" do
    context "the target value is in the tree" do
      subject { tree.lookup(12) }
      it { is_expected.to eq(right_right.id) }
    end

    context "the target value is not in the tree" do
      subject { tree.lookup(120) }
      it { is_expected.to be_nil }
    end
  end
end
