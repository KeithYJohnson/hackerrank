def solution(query, strings)
  query_occurences = 0
  strings.each do |string|
    query_occurences += 1 if string == query
  end
  query_occurences
end

# Read from STDIN
# occurences = Hash.new(0)
# num_strings.times do
#   string = gets.strip.chomp
#   occurences[string] += 1
# end

def faster_solution(query, occurence_hash)
    occurence_hash[query]
end
