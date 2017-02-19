require './wiggle_sequence'

describe WiggleSequence do
  context 'test case 1' do
    let(:array)  { [1,7,4,9,2,5] }
    let(:action) { described_class.new(array) }

    subject { action.perform }
    it { is_expected.to eq(6) }
  end

  context 'test case 2' do
    let(:array)  { [1,17,5,10,13,15,10,5,16,8] }
    let(:action) { described_class.new(array) }

    subject { action.perform }
    it { is_expected.to eq(7) }
  end

  context 'test case 3' do
    let(:array)  { [1,2,3,4,5,6,7,8,9] }
    let(:action) { described_class.new(array) }

    subject { action.perform }
    it { is_expected.to eq(2) }
  end
end
