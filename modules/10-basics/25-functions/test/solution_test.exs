defmodule Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "print twice" do
    msg = capture_io(fn -> Solution.print_twice("WoW") end) |> String.trim()
    assert msg == "WoW\nWoW"
  end
end
