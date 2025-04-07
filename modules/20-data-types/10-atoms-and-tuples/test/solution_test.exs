defmodule Test do
  use ExUnit.Case
  import Solution

  test "distance not changed" do
    assert 5.0 == distance({:point, 0, 0}, {:point, 0, 5})
    assert 5.0 == distance({:point, 5, 0}, {:point, 0, 0})
    assert 0.0 == distance({:point, 5, 5}, {:point, 5, 5})
    assert 5.0 == distance({:point, 0, 0}, {:point, 3, 4})
    assert 5.0 == distance({:point, 0, 0}, {:point, -3, -4})
  end

  test "bigger distance not changed" do
    assert 12.806248474865697 == distance({:point, 2, 2}, {:point, 10, 12})
    assert 21.213203435596427 == distance({:point, -5, -5}, {:point, 10, 10})
    assert 21.400934559032695 == distance({:point, -5, 5}, {:point, 8, -12})
    assert 17.26267650163207 == distance({:point, -5, 5}, {:point, -8, -12})
  end

  test "point inside circle" do
    point = {:point, 50, 50}
    assert point_inside_circle?(point, {:circle, {:point, 10, 10}, 100})
    assert not point_inside_circle?(point, {:circle, {:point, -10, -10}, 20})
  end

  test "point inside rect" do
    point = {:point, -10, 20}
    assert point_inside_rect?(point, {:rect, {:point, -20, 30}, {:point, 20, 10}})
    assert not point_inside_rect?(point, {:rect, {:point, 0, 0}, {:point, 10, 10}})
  end
end
