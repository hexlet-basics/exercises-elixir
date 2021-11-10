defmodule Test do
  use ExUnit.Case
  import Solution

  test "range test" do
    assert [1, 2, 3, 4, 5] == range(1, 5)
    assert [4, 5, 6, 7, 8, 9, 10] == range(4, 10)
    assert [-2, -1, 0, 1, 2, 3] == range(-2, 3)
    assert [2] == range(2, 2)
    assert [] == range(3, 2)
    assert [] == range(3, -2)
    assert [-3, -2] == range(-3, -2)
  end
end
