defmodule Solution do
  # BEGIN
  def get_age(user) do
    {:user, _name, age} = user
    age
  end

  def get_names(users) do
    [
      {:user, name1, _},
      {:user, name2, _},
      {:user, name3, _}
    ] = users

    [name1, name2, name3]
  end

  # END
end
