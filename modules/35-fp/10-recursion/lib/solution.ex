defmodule Solution do

  # BEGIN
  def range(from, to) when from <= to do
    [from | range(from + 1, to)]
  end
  def range(_, _), do: []
  # END

end
