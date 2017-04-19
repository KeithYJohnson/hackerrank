def xor_array(a)
  result = nil
  a.each do |elem|
    xored = elem.inject(:^)
    if result
      result ^= xored
    else
      result  = xored
    end
  end
  result
end


# This will return the elements to be bitwised in the order the test cases expect
# gets only contiguous subarrays
def asc_step_get_subarrays(a, subarrays=[], step_size=1)
  return subarrays if step_size > a.length

  a.each_cons(step_size) do |a|
    subarrays << a
  end

  step_size += 1
  asc_step_get_subarrays(a, subarrays, step_size)
end

a = [1,2,3]
subarrays = asc_step_get_subarrays(a)
p xor_array(subarrays) == 2

a = [4, 5, 7, 5]
subarrays = asc_step_get_subarrays(a)
p xor_array(subarrays) == 0
