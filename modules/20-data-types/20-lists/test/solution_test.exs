defmodule Test do
  use ExUnit.Case
  import Solution

  test "get second item" do
    assert 42 == get_second_item([20, 22, 24])
    assert 3 == get_second_item([1, 2, 3, 4])
    assert -3 == get_second_item([-1, -2, -3, -4])
  end
end
