defmodule Solution do
  # BEGIN
  def validate(str) do
    with {:not_binary, true} <- {:not_binary, is_binary(str)},
         {:too_long, true} <- {:too_long, String.length(str) <= 8},
         {:too_short, true} <- {:too_short, 2 <= String.length(str)} do
      {:ok, str}
    else
      {:not_binary, _} -> {:error, :not_binary}
      {:too_long, _} -> {:error, :too_long}
      {:too_short, _} -> {:error, :too_short}
    end
  end

  # END
end
