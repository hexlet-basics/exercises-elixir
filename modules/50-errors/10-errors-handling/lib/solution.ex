defmodule Solution do
  # BEGIN
  def my_div(x, y) when y == 0,
    do: raise(ArgumentError, message: "Divide #{x} by zero is prohibited!")

  def my_div(x, y) do
    Integer.floor_div(x, y)
  end

  # END
end
