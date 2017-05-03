a = %w(1 2 3 4 5).map(&:to_i)
def solution(a)
  largest_rect = 0
  a.each_with_index do |e, idx|
    with_same_height = 1 # starting off by counting itself
    prev_idx = idx - 1
    next_idx = idx + 1

    while prev_idx >= 0 && a[prev_idx] >= e
      with_same_height += 1
      prev_idx         -= 1
    end

    while next_idx <= a.length - 1 && a[next_idx] >= e
      with_same_height += 1
      next_idx         += 1
    end

    rect_area = e * with_same_height
    largest_rect = rect_area if rect_area > largest_rect
  end
  largest_rect
end

puts solution(a)
