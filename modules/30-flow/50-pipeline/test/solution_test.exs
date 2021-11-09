defmodule Test do
  use ExUnit.Case
  import Solution

  test "greets the world" do
    assert "my cool stringmy cool string" == process(" My Cool String  ", 2)
    assert "boom-boom-boom-" == process("  BOOM-  ", 3)
  end
end
