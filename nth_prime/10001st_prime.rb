require 'benchmark'

def is_prime?(n)
  return false if n == 1
  return true  if n == 2
  return false  if n % 2 == 0

  # That last return plus starting the loop at 3
  # Should cut down the input size wrt big o by 1/2
  (3).upto(n / 2) do |i|
    return false if n % i == 0
  end
  true
end

def slower_is_prime?(n)
  return false if n == 1
  return true  if n == 2

  (3).upto(n - 1) do |i|
    return false if n % i == 0
  end
  true
end


Benchmark.bm do |x|
      # user     system      total        real
  #  16.690000   0.220000  16.910000 ( 20.353171)
  x.report do
    found_primes = 0
    current_num  = 1
    while found_primes < 10_002
      if is_prime?(current_num)
        found_primes += 1
        puts "found a prime:#{current_num}, found_primes: #{found_primes}"
      end
      current_num += 1
    end
  end

    # user     system      total        real
  #  42.390000   1.020000  43.410000 ( 50.647415)
  x.report do
    found_primes = 0
    current_num  = 100
    while found_primes < 10_002
      if slower_is_prime?(current_num)
        found_primes += 1
        puts "found a prime:#{current_num}, found_primes: #{found_primes}"
      end
      current_num += 1
    end
  end

end
