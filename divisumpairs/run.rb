# https://www.hackerrank.com/challenges/divisible-sum-pairs?h_r=next-challenge&h_v=zen

def solution(a, k)
  num_pairs_evenly_divisible = 0

  0.upto(a.length - 2) do |i|

    (i+1).upto(a.length - 1) do |j|
      pair_sum = [a[i], a[j]].inject(:+)
      num_pairs_evenly_divisible += 1 if pair_sum % k == 0
    end
  end

  num_pairs_evenly_divisible
end

a = %w(1 3 2 6 1 2).map(&:to_i)
p solution(a, 3)
