def run_game(arr, current_turn=1)
  # p "arr: #{arr}, current_turn: #{current_turn}"
  if current_turn == 1
    puts "starting_sum : #{arr.inject(:+)}, starting_length : #{arr.length}"
  end
  1.upto(arr.length - 2) do |idx|
    prev      = arr[idx - 1]
    current   = arr[idx]
    following = arr[idx + 1]

    if prev == 0 && following == 0
      arr.delete_at(idx)
      return run_game(arr, current_turn + 1)
    end
  end

  if current_turn.odd?
    puts "Bob"
  else
    puts "Alice"
  end
end

def run_game_reverse(arr, current_turn=1)
  # p "arr: #{arr}, current_turn: #{current_turn}"
  if current_turn == 1
    puts "starting_sum : #{arr.inject(:+)}, starting_length : #{arr.length}"
  end
  (arr.length - 2).downto(1) do |idx|
    prev      = arr[idx - 1]
    current   = arr[idx]
    following = arr[idx + 1]

    if prev == 0 && following == 0
      arr.delete_at(idx)
      return run_game_reverse(arr, current_turn + 1)
    end
  end

  if current_turn.odd?
    puts "Bob"
  else
    puts "Alice"
  end
end


game1 = %w(1 0 0 1).map(&:to_i)
run_game(game1) # Bob
#
game2 = %w(1 0 1 0 1).map(&:to_i)
run_game(game2)  # Alice
#
game3 = %w(0 0 0 0 0 0).map(&:to_i)
run_game(game3) # Bob

game4 = %w(0 0 0 0 0 0 0).map(&:to_i)
run_game(game4) # Bob

game5 = %w(0 1 0 0 1 0 0).map(&:to_i)
run_game_reverse(game5)

game5 = %w(0 1 0 0 1 0 0).map(&:to_i)
run_game(game5)

game6 = %w(0 1 0 1 1 0 0).map(&:to_i)
run_game(game6)

game6 = %w(0 0 1 0 1 1 0 0).map(&:to_i)
run_game(game6)

game6 = %w(0 1 1 0 1 1 0 0).map(&:to_i)
run_game(game6)

game6 = %w(0 1 1 1 1 1 0 0).map(&:to_i)
run_game(game6)

game6 = %w(0 1 1 1 1 1 1 0).map(&:to_i)
run_game(game6)

game6 = %w(0 1 1 0 1 0 1 0).map(&:to_i)
run_game(game6)
