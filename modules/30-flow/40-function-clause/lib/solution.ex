defmodule Solution do
  # BEGIN
  def valid_game?({row1, row2, row3}) do
    valid_row(row1) and valid_row(row2) and valid_row(row3)
  end

  def valid_game?(_), do: false

  def valid_row({cell1, cell2, cell3}) do
    valid_cell(cell1) and valid_cell(cell2) and valid_cell(cell3)
  end

  def valid_row(_), do: false

  def valid_cell(:x), do: true
  def valid_cell(:o), do: true
  def valid_cell(:f), do: true
  def valid_cell(_), do: false

  def check_who_win({{c, c, c}, _, _}) when c != :f, do: {:win, c}
  def check_who_win({_, {c, c, c}, _}) when c != :f, do: {:win, c}
  def check_who_win({_, _, {c, c, c}}) when c != :f, do: {:win, c}
  def check_who_win({{c, _, _}, {c, _, _}, {c, _, _}}) when c != :f, do: {:win, c}
  def check_who_win({{_, c, _}, {_, c, _}, {_, c, _}}) when c != :f, do: {:win, c}
  def check_who_win({{_, _, c}, {_, _, c}, {_, _, c}}) when c != :f, do: {:win, c}
  def check_who_win({{c, _, _}, {_, c, _}, {_, _, c}}) when c != :f, do: {:win, c}
  def check_who_win({{_, _, c}, {_, c, _}, {c, _, _}}) when c != :f, do: {:win, c}
  def check_who_win(_), do: :no_win
  # END
end
