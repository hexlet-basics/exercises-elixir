defmodule Solution do
  @spec shift_days(
          time :: Time.t() | NaiveDateTime.t() | Date.t() | Time.t(),
          amount :: integer()
        ) :: Time.t() | NaiveDateTime.t() | Date.t() | Time.t()
  # BEGIN
  def shift_days(time, 0), do: time

  def shift_days(%Time{} = time, amount) when is_integer(amount) do
    Time.add(time, amount * 24, :hour)
  end

  def shift_days(%NaiveDateTime{} = time, amount) when is_integer(amount) do
    NaiveDateTime.add(time, amount, :day)
  end

  def shift_days(%Date{} = time, amount) when is_integer(amount) do
    Date.add(time, amount)
  end

  def shift_days(%DateTime{} = time, amount) when is_integer(amount) do
    DateTime.add(time, amount, :day)
  end

  # END
end
