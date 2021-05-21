defmodule Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "do math" do
    assert call_solution(10, 10) == {2.0, 1, 0}
    assert call_solution(15, 5) == {4.0, 3, 5}
    assert call_solution(42, 3) == {15.0, 14, 3}
    assert call_solution(20, 40) == {1.5, 0, 0}
    assert call_solution(20, 8) == {3.5, 2, 8}
  end

  defp call_solution(a, b) do
    [a, b, c] =
      capture_io(fn -> Solution.do_math(a, b) end)
      |> String.trim()
      |> String.split()
    {String.to_float(a), String.to_integer(b), String.to_integer(c)}
  end
end
