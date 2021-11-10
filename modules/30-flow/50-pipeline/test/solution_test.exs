defmodule Test do
  use ExUnit.Case
  import Solution

  test "process test" do
    assert "my cool stringmy cool string" == process(" My Cool String  ", 2)
    assert "boom-boom-boom-" == process("  BOOM-  ", 3)
  end
end
