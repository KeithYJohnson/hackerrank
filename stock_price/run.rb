#get the maximum profit from buying once and then selling once.
def solution(a)
  max_profit = a[1] - a[0]
  min = 100_000 
  a.each_with_index do |i, idx|
    min = i if i < min
    next if idx == 0
    diff = i - min
    max_profit = diff if diff > max_profit
  end

  max_profit
end


a = [10, 7, 5, 8, 11, 9]
p solution a
