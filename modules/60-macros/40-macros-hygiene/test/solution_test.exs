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
    assert with_io(fn ->
             Exercise.run_fn(fn -> 1 + 5 end)
           end) == {6, "Started execution...\nExecution result is: 6\n"}

    assert with_io(fn ->
             Exercise.run_fn(fn -> %{hello: :world} end)
           end) ==
             {%{hello: :world}, "Started execution...\nExecution result is: %{hello: :world}\n"}

    assert with_io(fn ->
             Exercise.run_fn(fn -> "some string" end)
           end) == {"some string", "Started execution...\nExecution result is: \"some string\"\n"}
  end
end
