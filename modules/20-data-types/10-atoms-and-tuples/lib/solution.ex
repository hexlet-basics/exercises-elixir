defmodule Solution do
  # BEGIN
  def distance({:point, x1, y1}, {:point, x2, y2}) do
    x_dist = abs(x1 - x2)
    y_dist = abs(y1 - y2)
    :math.sqrt(:math.pow(x_dist, 2) + :math.pow(y_dist, 2))
  end

  def is_point_inside_circle(point, circle) do
    {:circle, center, radius} = circle
    distance(point, center) <= radius
  end

  def is_point_inside_rect(point, rect) do
    {:point, x, y} = point
    {:rect, left_top, right_bottom} = rect
    {:point, left_x, top_y} = left_top
    {:point, right_x, bottom_y} = right_bottom
    x >= left_x and x <= right_x and y <= top_y and y >= bottom_y
  end

  # END
end
