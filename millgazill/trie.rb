class Trie

  attr_accessor :array, :trie

  STOP_CHAR = "*"

  def initialize(array)
    self.array = array
    self.trie  =  { }
  end

  def perform
    array.each do |website|
      find_place_in_trie(website + STOP_CHAR, website[0], 0, trie)
    end
  end

  def find_place_in_trie(website, char, char_index, trie)
    # p char, char_index, trie
    char_index += 1
    if trie.has_key?(char)
      find_place_in_trie(website, website[char_index], char_index, trie[char])
    else
      trie[char] = {}
      if website[char_index]
        find_place_in_trie(website, website[char_index], char_index, trie[char])
      end
    end
  end
end
