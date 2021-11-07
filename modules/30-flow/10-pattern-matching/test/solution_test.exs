defmodule Test do
  use ExUnit.Case
  import Solution

  @bob {:user, "Bob", 42}
  @bill {:user, "Bill", 12}
  @helen {:user, "Helen", 20}
  @kate {:user, "Kate", 22}

  test "get_age test" do
    assert 42 == get_age(@bob)
    assert 12 == get_age(@bill)
    assert 20 == get_age(@helen)
    assert 22 == get_age(@kate)
  end

  test "get_names test" do
    assert ["Bob", "Helen", "Kate"] == get_names([@bob, @helen, @kate])
    assert ["Helen", "Bill", "Kate"] == get_names([@helen, @bill, @kate])
    assert ["Kate", "Bill", "Bob"] == get_names([@kate, @bill, @bob])
  end
end
