defmodule Test do
  use ExUnit.Case

  test "inc_numbers work" do
    assert Solution.inc_numbers(["foo", false, ["foo"]]) == []
    assert Solution.inc_numbers([10, "foo", false, true, ["foo"], 1.2, %{}, 32]) == [11, 2.2, 33]
    assert Solution.inc_numbers([1, 2, 3, 4, 5, 6.0]) == [2, 3, 4, 5, 6, 7.0]
  end
end
