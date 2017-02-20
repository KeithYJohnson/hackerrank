require 'pry-byebug'
class MakeEfficentHash

  attr_accessor :array, :hash

  def initialize(array)
    self.array = array
    self.hash  =  {"www.": {} }
  end

  def perform
    array.each do |website|
      split = website.split("www.")
      if split.length > 1
        self.hash[:"www."][split[-1]] = true
      else
        self.hash[website.to_sym] = true
      end
    end
  end
end

array = [
  "www.google.com",
  "www.bing.com",
  "espn.com",
  "nytimes.com"
]

action = MakeEfficentHash.new(array)
action.perform
p action.hash
