defmodule Test do
  use ExUnit.Case
  import Solution

  test "join_game test" do
    assert :ok == join_game({:user, "Bob", 17, :admin})
    assert :ok == join_game({:user, "Bob", 27, :admin})
    assert :ok == join_game({:user, "Bob", 17, :moderator})
    assert :ok == join_game({:user, "Bob", 27, :moderator})
    assert :error == join_game({:user, "Bob", 17, :member})
    assert :ok == join_game({:user, "Bob", 27, :member})
  end

  test "move_allowed? test" do
    assert move_allowed?(:white, {:pawn, :white})
    assert not move_allowed?(:black, {:pawn, :white})
    assert move_allowed?(:white, {:rock, :white})
    assert not move_allowed?(:black, {:rock, :white})
    assert not move_allowed?(:white, {:queen, :white})
    assert not move_allowed?(:black, {:queen, :white})
  end
end
