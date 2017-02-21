require './tree_node'

describe TreeNode do
  let(:root) { TreeNode.new(5) }

  before do
    tnl = TreeNode.new(2)
    tnr = TreeNode.new(3)

    tn2l = TreeNode.new(3)
    tn2r = TreeNode.new(3)

    tnl.left = tn2l
    tnl.right = tn2r

    root.left  = tnl
    root.right = tnr
  end

  describe "#sum" do
    it 'sums its val plus that of all nodes below it' do
      root.sum
      expect(root.sum_below).to eq(16)
    end
  end

  describe "#get_children" do
    it 'appends all children to .children' do
      root.get_children
      expect(root.children.length).to eq(4)
    end
  end

  describe "#most_frequent_sum_below" do
    it 'gets the most requents the most frequently occuring sum of all nodes' do
      expect(root.most_frequent_sum_below).to eq(3)
    end
  end
end
