defmodule Solution do
  def process(str, num) do
    # BEGIN
    str |> String.trim() |> String.downcase() |> String.duplicate(num)
    # END
  end
end
