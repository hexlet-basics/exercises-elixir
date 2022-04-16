defmodule Solution do

  # BEGIN
  def encode(str, code) when is_list(str) do
    Enum.map(str, fn(char) -> char + code end)
  end
  
  def decode(str, code) when is_list(str) do
    Enum.map(str, fn(char) -> char - code end)
  end
  # END

end
