defmodule Solution do
  # BEGIN
  def generate(num) do
    Stream.repeatedly(fn -> Enum.random(1..20) end) |> Enum.take(num)
  end

  # END
end
