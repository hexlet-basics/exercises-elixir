defmodule Solution do

  # BEGIN
  def filter_by_age(users, age) do
    filter_by_age(users, age, [])
  end

  defp filter_by_age([], _age, acc), do: Enum.reverse(acc)

  defp filter_by_age([user | users], age, acc) do
    {:user, _, _, user_age} = user
    if user_age > age do
      filter_by_age(users, age, [user | acc])
    else
      filter_by_age(users, age, acc)
    end
  end
  # END

end
