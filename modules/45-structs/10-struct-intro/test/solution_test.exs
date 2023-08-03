defmodule Test do
  use ExUnit.Case

  test "calculate_stats work" do
    assert Solution.calculate_stats([]) == %{humans: 0, pets: 0}
    assert Solution.calculate_stats([%User{}, %User{}, %Pet{}]) == %{humans: 2, pets: 1}
    assert Solution.calculate_stats([%Pet{}, %Pet{}, %Pet{}]) == %{humans: 0, pets: 3}
  end
end
