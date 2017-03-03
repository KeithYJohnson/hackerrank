# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

current_num = 2520 # TODO do math and find best starting point
a = (1..20).to_a
while true
  if a.all? { |i| current_num % i == 0 }
    puts current_num
    return
  end
  current_num += 20
end
