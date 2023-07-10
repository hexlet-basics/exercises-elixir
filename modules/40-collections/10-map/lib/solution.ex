defmodule Solution do
  # BEGIN
  def zip([], []), do: []

  def zip(first, second) do
    len = max(length(first), length(second))
    range = 0..(len - 1)

    Enum.map(range, fn index ->
      [Enum.at(first, index), Enum.at(second, index)]
    end)
  end

  # END
end
