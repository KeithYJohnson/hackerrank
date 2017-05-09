# p 147
# Triple Step: A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible ways the child can run up the stairs.
def solution(n, current= 0)
  if current == n
    return 1
  elsif current > n
    return 0
  end

  solution(n, current + 1) +
  solution(n, current + 2) +
  solution(n, current + 3)

end

p solution(2)
# 1 - 1
# 2 - 0

p solution(3)
# 1 - 1 - 1
# 2 - 1
# 1 - 2
# 3
