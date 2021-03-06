require './tree_node'

describe TreeNode do
  let(:root) { TreeNode.new(5) }
  let(:tn2l) { TreeNode.new(1) }
  let(:tn2r) { TreeNode.new(3) }
  let(:tnr)  { TreeNode.new(7) }

  before do
    tnl = TreeNode.new(2)


    tnl.left = tn2l
    tnl.right = tn2r

    root.left  = tnl
    root.right = tnr
  end

  describe "#get_levels" do
    before do
      tnr.left  = TreeNode.new(10)
      tnr.right = TreeNode.new(7)
    end
    it 'returns an array of arrays.  Each element is the subsequent level in the tree' do
      root.get_levels
      expect(root.levels.first.length).to eq(2)
      expect(root.levels.last.length).to eq(4)
    end
  end

  describe "#invert" do
    before do
      tnr.left  = TreeNode.new(10)
      tnr.right = TreeNode.new(7)
      root.get_levels
    end

    it 'inverts the tree' do
      before_inversion_levels = root.levels
      first_level_vals  = before_inversion_levels[0].map(&:val)
      second_level_vals = before_inversion_levels[1].map(&:val)

      root.invert

      expect(root.left.val).to  eq(first_level_vals.last)
      expect(root.right.val).to eq(first_level_vals.first)


      expect(root.left.left.val).to eq(second_level_vals[-1])
      expect(root.left.right.val).to eq(second_level_vals[-2])
      expect(root.right.right.val).to eq(second_level_vals[0])
      expect(root.right.left.val).to eq(second_level_vals[1])
    end
  end


  describe "#sum" do
    it 'sums its val plus that of all nodes below it' do
      root.sum
      expect(root.sum_below).to eq(18)
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
      expect(root.most_frequent_sum_below).to eq(18)
    end
  end

  describe "#insert" do
    it 'finds the appropriate place for the value in the tree' do
      left_most_leaf = TreeNode.new(0)
      root.insert(left_most_leaf)
      expect(tn2l.left).to eq(left_most_leaf)
    end

    context 'the value already exists' do
      it 'doesnt add it to the tree' do
        root.get_children
        num_childs = root.children.length
        root.insert(TreeNode.new(5))
        root.get_children
        expect(root.children.length).to eq(num_childs)
      end
    end

    context "largest value" do
      it 'puts it as the rightmost leaf' do
        right_most_leaf = TreeNode.new(100)
        root.insert(right_most_leaf)
        expect(tnr.right).to eq(right_most_leaf)
      end
    end
  end

  describe "#search" do
    context "its in the tree" do
      subject { root.search(1) }
      it { is_expected.to eq(tn2l) }

    end

    context "its not in the tree" do
      subject { root.search(50) }
      it { is_expected.to be_nil }
    end
  end
end
