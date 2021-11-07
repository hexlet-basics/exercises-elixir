defmodule Solution do
  def join_game(user) do
    case user do
      {:user, _name, _age, :admin} -> :ok
      {:user, _name, _age, :moderator} -> :ok
      {:user, _name, age, _role} when age >= 18 -> :ok
      _ -> :error
    end
  end

  def move_allowed?(current_color, figure) do
    case figure do
      {:pawn, ^current_color} -> true
      {:rock, ^current_color} -> true
      _ -> false
    end
  end
end
