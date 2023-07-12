defmodule Test do
  use ExUnit.Case

  test "generate work" do
    count = 5
    numbers = Solution.generate(count)

    assert validate_result(numbers, count)

    count = 2
    numbers = Solution.generate(count)

    assert validate_result(numbers, count)

    count = 30
    numbers = Solution.generate(count)

    assert validate_result(numbers, count)
  end

  defp validate_result(result, count) do
    elements_validation = Enum.map(result, fn x -> is_number(x) && x in 1..20 end) |> Enum.all?()

    elements_validation && length(result) == count
  end
end
