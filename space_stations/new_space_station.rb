class FindMaxDistance
  attr_accessor :num_cities, :num_stations, :cities_w_stations, :strategy

  def initialize(num_cities, num_stations, cities_w_stations, strategy=method(:be_fancy))
    self.num_cities        = num_cities
    self.num_stations      = num_stations
    self.cities_w_stations = cities_w_stations.sort!
    self.strategy          = strategy
  end

  def perform
    strategy.call
  end

  def be_fancy
    max_distance = handle_ends

    cities_w_stations.each_cons(2) do |a, b|
      a = a.to_f
      b = b.to_f
      distance = ((b - a - 1).abs / 2).ceil
      max_distance = distance if distance > max_distance
    end
    max_distance
  end

  def handle_ends
    # Because the "divide by 2" breaks on the ends of the string of cities
    start_distance = cities_w_stations[0]
    end_distance   = (num_cities - 1) - cities_w_stations[-1]
    [start_distance, end_distance].max
  end

  def compare_each_city
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

input = File.readlines('input2.txt')
num_cities, num_stations = input[0].strip.split(' ')
num_cities = num_cities.to_i
num_stations = num_stations.to_i
cities_w_stations = input[1].strip
cities_w_stations = cities_w_stations.split(' ').map(&:to_i)

action = FindMaxDistance.new(num_cities, num_stations, cities_w_stations)
puts action.perform
