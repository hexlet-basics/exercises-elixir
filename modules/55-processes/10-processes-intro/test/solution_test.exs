defmodule Test do
  use ExUnit.Case

  test "run_in_process work" do
    assert Solution.run_in_process(fn -> 2 + 2 end) |> is_pid()
    assert Solution.run_in_process(fn -> "hello world" end) |> is_pid()
  end
end
