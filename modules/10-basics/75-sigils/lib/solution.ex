defmodule Solution do
  # BEGIN
  def sigil_i(string, []), do: String.to_integer(string)

  def sigil_i(string, [?n]), do: -String.to_integer(string)

  # END
end
