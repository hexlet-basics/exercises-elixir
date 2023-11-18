defmodule Solution do
  @spec shift_days(
          time :: Time.t() | NaiveDateTime.t() | Date.t() | Time.t(),
          amount :: integer()
        ) :: Time.t() | NaiveDateTime.t() | Date.t() | Time.t()
  # BEGIN
  def shift_days(time, 0), do: time

  def shift_days(%Time{} = time, amount) when is_integer(amount) do
    Time.add(time, days_to_seconds(amount) * 24, :second)
  end

  def shift_days(%NaiveDateTime{} = time, amount) when is_integer(amount) do
    NaiveDateTime.add(time, days_to_seconds(amount), :second)
  end

  def shift_days(%Date{} = time, amount) when is_integer(amount) do
    Date.add(time, amount)
  end

  def shift_days(%DateTime{} = time, amount) when is_integer(amount) do
    DateTime.add(time, days_to_seconds(amount), :second)
  end

  defp days_to_seconds(amount) do
    amount * 24 * 60 * 60
  end

  # END
end
