defmodule Test do
  use ExUnit.Case

  test "addition" do
    assert Solution.calculate("+", 2, 3) == 5
    assert Solution.calculate("+", 0, -3) == -3
  end

  test "substraction" do
    assert Solution.calculate("-", 2, 3) == -1
    assert Solution.calculate("-", 0, 3) == -3
    assert Solution.calculate("-", 5, 3) == 2
  end

  test "division" do
    assert Solution.calculate("/", 4, 4) == 1.0
    assert Solution.calculate("/", 3, 2) == 1.5
    assert Solution.calculate("/", 4, 2) == 2.0
  end

  test "multiply" do
    assert Solution.calculate("*", 2, 2) == 4
    assert Solution.calculate("*", 0, 2) == 0
    assert Solution.calculate("*", 4, -2) == -8
  end
end
