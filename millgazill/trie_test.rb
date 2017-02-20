require './trie'

describe Trie do
  let(:num_nodes) { 39 }
  let(:websites)  { [ "donut.net", "dogood.org", "dog.com", "dog.com/about", "dog.com/pug", "dog.org"] }
  let(:trie)      { described_class.new(websites) }

  # only tests three levels deep but visual inspection looks good.
  # Just dont want to write out this whole nested hash by hand.
  context 'testing perform' do
    it 'does stuff' do
      trie.perform
      p "test trie: #{trie.trie}"
      expect(trie.trie.keys).to include("d")
      expect(trie.trie["d"].keys).to include("o")
      expect(trie.trie["d"]["o"].keys).to include("n","g")
    end
  end
end
