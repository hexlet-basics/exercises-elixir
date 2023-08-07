defmodule Solution do
  # BEGIN
  def compare(first, _) when not is_integer(first), do: {:error, :not_number}
  def compare(_, second) when not is_integer(second), do: {:error, :not_number}

  def compare(first, second) do
    cond do
      first == second -> {:ok, :equal}
      first < second -> {:ok, :less}
      first > second -> {:ok, :greater}
    end
  end

  # END
end
