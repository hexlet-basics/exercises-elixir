defmodule Test do
  use ExUnit.Case

  test "my_div work" do
    assert_raise(ArgumentError, "Divide 10 by zero is prohibited!", fn ->
      Solution.my_div(10, 0)
    end)

    assert_raise(ArgumentError, "Divide 128 by zero is prohibited!", fn ->
      Solution.my_div(128, 0)
    end)

    assert Solution.my_div(128, 2) == 64
    assert Solution.my_div(0, 2) == 0
  end
end
