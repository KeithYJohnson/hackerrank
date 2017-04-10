# Triple Step: A child is running up a staircase with n steps and
# can hop either 1 step, 2 steps, or 3 steps at a time. Implement
# a method to count how many possible ways the child can run up the stairs.

def solution(num_steps)
  return 1 if num_steps == 0
  return 0 if num_steps <  0

  solution(num_steps - 3) + solution(num_steps - 2) + solution(num_steps - 1)
end

p solution(3)
