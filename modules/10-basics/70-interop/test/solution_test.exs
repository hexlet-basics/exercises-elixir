defmodule Test do
  use ExUnit.Case

  test "hours_to_milliseconds work" do
    assert Solution.hours_to_milliseconds(0) == 0
    assert Solution.hours_to_milliseconds(1) == 3_600_000
    assert Solution.hours_to_milliseconds(1.5) == 5_400_000.0
    assert Solution.hours_to_milliseconds(2) == 7_200_000
  end
end
