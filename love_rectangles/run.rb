# Credit to https://gist.github.com/senorprogrammer/1058413
class Range
  def intersection(other)
    raise ArgumentError, 'value must be a Range' unless other.kind_of?(Range)

    my_min, my_max = first, exclude_end? ? max : last
    other_min, other_max = other.first, other.exclude_end? ? other.max : other.last

    new_min = self === other_min ? other_min : other === my_min ? my_min : nil
    new_max = self === other_max ? other_max : other === my_max ? my_max : nil

    new_min && new_max ? new_min..new_max : nil
  end

  alias_method :&, :intersection
end


def solution(recta, rectb)
  recta_right_x = recta['left_x']   + recta['width']
  recta_top_y   = recta['bottom_y'] + recta['height']

  rectb_right_x = rectb['left_x']   + rectb['width']
  rectb_top_y   = rectb['bottom_y'] + rectb['height']

  x_overlap = (recta['left_x']..recta_right_x).intersection((rectb['left_x']..rectb_right_x))
  y_overlap = (recta['bottom_y']..recta_top_y).intersection((rectb['bottom_y']..rectb_top_y))

  if x_overlap && y_overlap
    {
      'left_x':   x_overlap.first,
      'right_x':  x_overlap.last,
      'bottom_y': y_overlap.first,
      'top_y':    y_overlap.last
    }
  else
    'no intersection'
  end
end

a = {

  # coordinates of bottom-left corner
  'left_x' => 1,
  'bottom_y' => 5,

  # width and height
  'width' => 10,
  'height' => 4
}

b = {
  # coordinates of bottom-left corner
  'left_x' => 2,
  'bottom_y' => 2,

  # width and height
  'width' => 10,
  'height' => 4
}

p solution(a, b)
