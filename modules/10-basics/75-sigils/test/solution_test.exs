defmodule Test do
  use ExUnit.Case

  import Solution

  test "sigil_i work" do
    assert ~i(10) == 10
    assert ~i(5)n == -5
    assert ~i(-15)n == 15
  end
end
