defmodule Test do
  use ExUnit.Case

  require Solution

  test "my_unless work" do
    assert Solution.my_unless(false, do: 1 + 3) == 4
    refute Solution.my_unless(true, do: 2)
    refute Solution.my_unless(2 == 2, do: "Hello")
    assert Solution.my_unless(1 == 2, do: "world") == "world"
  end
end
