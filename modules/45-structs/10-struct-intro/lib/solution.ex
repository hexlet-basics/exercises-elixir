defmodule User do
  defstruct name: "John"
end

defmodule Pet do
  defstruct name: "Barkley"
end

defmodule Solution do
  # BEGIN
  @default_stats %{humans: 0, pets: 0}

  def calculate_stats([]), do: @default_stats

  def calculate_stats(humans_and_pets) do
    Enum.reduce(humans_and_pets, @default_stats, &stat_member/2)
  end

  defp stat_member(%User{}, acc) do
    Map.update(acc, :humans, 0, fn curr -> curr + 1 end)
  end

  defp stat_member(%Pet{}, acc) do
    Map.update(acc, :pets, 0, fn curr -> curr + 1 end)
  end

  # END
end
