require 'prime'
# https://www.hackerrank.com/challenges/waiter
def solution(a, ith_iter)
  ith_prime = PRIMES[ith_iter - 1]
  ith_prime_stack     = []
  ith_composite_stack = []

  until a.empty?
    current = a.pop
    current % ith_prime == 0 ? ith_prime_stack << current : ith_composite_stack << current
  end

  until ith_prime_stack.empty?
    current = ith_prime_stack.pop
    puts current
  end

  ith_composite_stack
end


input = File.readlines('input.txt')
num_places, num_iterations = input[0].strip.chomp.split(' ').map(&:to_i)
a = input[-1].strip.chomp.split(' ').map(&:to_i)

PRIMES = Prime.take(num_iterations)

ith_composite_stack = a
num_iterations.times do |i|
  ith_iter = i + 1
  ith_composite_stack = solution(ith_composite_stack, ith_iter)
end

ith_composite_stack.reverse_each { |e| p e }
