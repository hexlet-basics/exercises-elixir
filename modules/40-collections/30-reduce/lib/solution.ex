defmodule Solution do
  # BEGIN
  def max_delta([], []), do: 0

  def max_delta(first, second) do
    Enum.zip(first, second)
    |> Enum.reduce(0, fn {x, y}, acc ->
      diff = abs(x - y)
      max(acc, diff)
    end)
  end

  # END
end
