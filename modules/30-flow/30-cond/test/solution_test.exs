defmodule Test do
  use ExUnit.Case
  import Solution

  test "single_win? test" do
    assert single_win?(true, false)
    assert single_win?(false, true)
    assert not single_win?(true, true)
    assert not single_win?(false, false)
  end

  test "double_win? test" do
    assert :ab == double_win?(true, true, false)
    assert :bc == double_win?(false, true, true)
    assert :ac == double_win?(true, false, true)
    assert not double_win?(true, true, true)
    assert not double_win?(false, false, false)
    assert not double_win?(true, false, false)
    assert not double_win?(false, true, false)
    assert not double_win?(false, false, true)
  end
end
