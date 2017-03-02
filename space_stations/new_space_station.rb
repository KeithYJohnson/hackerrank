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
    self.cities_w_stations = cities_w_stations.sort!
  end

  def perform
    max_distance = 0
    (0...num_cities).each do |i|
      distance = find_closest_station(i)
      max_distance = distance if distance > max_distance
    end
    max_distance
  end

  def find_closest_station(city)
    cities_w_stations.each_with_index do |station, index|
      if station == city
        return 0
      elsif station > city
        next_station         = station
        previous_station     = cities_w_stations[index - 1]
        distance_to_previous = (previous_station - city).abs
        distance_to_next     = (next_station - city).abs
        return [distance_to_previous, distance_to_next].min
      end
    end
    city - cities_w_stations[-1]
  end
end

input = File.readlines('input_1.txt')
num_cities, num_stations = input[0].strip.split(' ')
num_cities = num_cities.to_i
num_stations = num_stations.to_i
cities_w_stations = input[1].strip
cities_w_stations = cities_w_stations.split(' ').map(&:to_i)

action = FindMaxDistance.new(num_cities, num_stations, cities_w_stations)
puts action.perform
