defmodule Test do
  use ExUnit.Case
  import Solution

  setup do
    users = [
      {:user, 1, "Bob", 23},
      {:user, 2, "Helen", 20},
      {:user, 3, "Bill", 15},
      {:user, 4, "Kate", 14}
    ]
    [users: users]
  end

  test "filter_by_age test", %{users: users} do
    assert filter_by_age(users, 30) == []
    assert filter_by_age(users, 23) == []
    assert filter_by_age(users, 22) == [{:user, 1, "Bob", 23}]
    assert filter_by_age(users, 20) == [{:user, 1, "Bob", 23}]
    assert filter_by_age(users, 19) == [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}]
    assert filter_by_age(users, 15) == [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}]
    assert filter_by_age(users, 14) == [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}, {:user, 3, "Bill", 15}]
    assert filter_by_age(users, 13) == [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}, {:user, 3, "Bill", 15}, {:user, 4, "Kate", 14}]
    assert filter_by_age(users, 10) == [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}, {:user, 3, "Bill", 15}, {:user, 4, "Kate", 14}]
  end
end
