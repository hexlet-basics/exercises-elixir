defmodule Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "greets the world" do
    msg = capture_io(fn -> Solution.hello() end)
          |> String.trim
    assert msg == "Hello, World!"
  end
end
