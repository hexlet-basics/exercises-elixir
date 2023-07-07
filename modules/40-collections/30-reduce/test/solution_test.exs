defmodule Test do
  use ExUnit.Case

  test "max_delta work" do
    assert Solution.max_delta([], []) == 0
    assert Solution.max_delta([-5], [-15]) == 10
    assert Solution.max_delta([0], [42]) == 42
    assert Solution.max_delta([10, -15, 35], [2, -12, 42]) == 8
  end
end
