defmodule Test do
  use ExUnit.Case

  require Solution

  test "my_abs macro work" do
    assert Solution.my_abs(-2) == 2
    assert Solution.my_abs(2) == 2
    assert Solution.my_abs(-5 * 100) == 500
    assert Solution.my_abs(-2 - 100 + 1) == 101
  end
end
