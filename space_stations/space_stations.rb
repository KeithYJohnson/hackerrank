require 'pry-byebug'
# 5 2
# 0 4
require 'optparse'

num_cities, num_space_stations = "5 2".strip.split(' ')
num_cities = num_cities.to_i
m = num_space_stations.to_i
c = "0 4".strip
indices_w_stations = c.split(' ').map(&:to_i)

#
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-15") do |v|
    # Times out on hackerank but this does correctly return 63
    file = File.readlines('test_case_15_input.txt')
    num_cities, num_space_stations = file[0].strip.split(' ')
    num_cities = num_cities.to_i
    m = num_space_stations.to_i
    c = file[1].strip
    indices_w_stations = c.split(' ').map(&:to_i)
  end

  opts.on("-2") do |v|
    # Times out on hackerank but this does correctly return 63
    file = File.readlines('test_case_2.txt')
    num_cities, num_space_stations = file[0].strip.split(' ')
    num_cities = num_cities.to_i
    m = num_space_stations.to_i
    c = file[1].strip
    indices_w_stations = c.split(' ').map(&:to_i)
  end
end.parse!

class FindMaxDistance
  attr_accessor :num_cities, :indices_w_stations, :max_distance, :num_space_stations, :max_d_indices

  def initialize(num_cities, indices_w_stations)
      self.num_cities = num_cities
      self.indices_w_stations = indices_w_stations.sort!
      self.max_distance = 0
      self.num_space_stations = indices_w_stations.length
      self.max_d_indices = []
  end

  def perform
    # This is to take into account the distance between the first and last cities
    # and their closest space stations.
    self.indices_w_stations = indices_w_stations.unshift(0) << (num_cities - 1)

    indices_w_stations.each_with_index do |space_station, index|
      if index == 0
        next
      end
      distance = (indices_w_stations[index] - indices_w_stations[index - 1]).abs
      if distance > max_distance
        self.max_distance = distance
        self.max_d_indices = [indices_w_stations[index], indices_w_stations[index - 1]]
      end
    end
  end
end

thing = FindMaxDistance.new(num_cities, indices_w_stations)
thing.perform
idxs = thing.indices_w_stations
md  = thing.max_distance
mdi = thing.max_d_indices
p mdi
binding.pry
puts "#{thing.max_distance}"
