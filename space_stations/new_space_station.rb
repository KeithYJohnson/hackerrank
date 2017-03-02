require 'pry-byebug'

# num_cities, num_stations = gets.strip.split(' ')
# num_cities = n.to_i
# num_stations = m.to_i
# cities_w_stations = gets.strip
# cities_w_stations = gets.strip
# cities_w_stations = c.split(' ').map(&:to_i)

class FindMaxDistance
  attr_accessor :num_cities, :num_stations, :cities_w_stations

  def initialize(num_cities, num_stations, cities_w_stations)
    self.num_cities        = num_cities
    self.num_stations      = num_stations
    self.cities_w_stations = cities_w_stations
    puts "analyzing num_cities: #{num_cities}"
  end

  def perform
    max_distance = 0
    (0...num_cities).each do |i|
      distance = find_closest_station(i)
      max_distance = distance if distance > max_distance
    end
    p max_distance
  end

  def find_closest_station(city)
    min_distance = num_cities - 1

    cities_w_stations.each_with_index do |station, index|
      distance = (station - city).abs
      min_distance = distance if distance < min_distance
    end

    min_distance
  end
end

input = File.readlines('input_15.txt')
num_cities, num_stations = input[0].strip.split(' ')
num_cities = num_cities.to_i
num_stations = num_stations.to_i
cities_w_stations = input[1].strip
cities_w_stations = cities_w_stations.split(' ').map(&:to_i)

action = FindMaxDistance.new(num_cities, num_stations, cities_w_stations)
puts action.perform
