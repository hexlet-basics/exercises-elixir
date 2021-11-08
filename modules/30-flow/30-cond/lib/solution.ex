defmodule Solution do
  # BEGIN
  def single_win?(a_win, b_win) do
    cond do
      a_win and not b_win -> true
      b_win and not a_win -> true
      true -> false
    end
  end

  def double_win?(a_win, b_win, c_win) do
    cond do
      a_win and b_win and not c_win -> :ab
      a_win and c_win and not b_win -> :ac
      b_win and c_win and not a_win -> :bc
      true -> false
    end
  end
  # END
end
