# Magic Index: A magic index in an array A[e... n-1] is
# defined to be an index such that A[ i] = i. Given a
# sorted array of distinct integers, write a method to
# find a magic index, if one exists, in array A.

def solution(a, offset=0)
  return -1 if a.empty?
  mid_idx = a.length / 2

  if a[mid_idx] == mid_idx
    return mid_idx + offset
  elsif a[mid_idx] < mid_idx

    # [1,1,1,1,3], a[3] = 1
    solution(a[0...mid_idx], offset)
  else #a[mid_idx] > mid_idx

    # [1,4,4,4,4] a[2] = 4
    offset += (mid_idx + 1)
    solution(a[(mid_idx+1)..-1], offset)
  end
end

p solution([1,2,3])
