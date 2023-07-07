defmodule Solution do
  # BEGIN
  def inc_numbers(elements) do
    elements
    |> Enum.filter(&is_number/1)
    |> Enum.map(&(&1 + 1))
  end

  # END
end
