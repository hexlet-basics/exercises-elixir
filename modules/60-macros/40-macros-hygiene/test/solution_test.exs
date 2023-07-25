defmodule Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  defmodule Exercise do
    require Solution

    def run_fn(function) do
      Solution.with_logging do
        function
      end
    end
  end

  test "with_logging work" do
    assert capture_io(fn -> Exercise.run_fn(fn -> 1 + 5 end) end) ==
             "Started execution...\nExecution result is: 6\n"

    assert capture_io(fn -> Exercise.run_fn(fn -> %{hello: :world} end) end) ==
             "Started execution...\nExecution result is: %{hello: :world}\n"

    assert capture_io(fn ->
             Exercise.run_fn(fn -> "some string" end)
           end) == "Started execution...\nExecution result is: \"some string\"\n"
  end
end
