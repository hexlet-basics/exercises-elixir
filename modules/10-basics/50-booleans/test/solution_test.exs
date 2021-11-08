defmodule Test do
  use ExUnit.Case

  test "any?" do
    assert false == Solution.any?(false, false, false, false)
    assert true == Solution.any?(true, false, false, false)
    assert true == Solution.any?(false, true, false, false)
    assert true == Solution.any?(false, false, true, false)
    assert true == Solution.any?(false, false, false, true)
    assert true == Solution.any?(false, true, false, true)
  end

  test "truthy?" do
    assert 42 == Solution.truthy?(true, 42)
    assert [42] == Solution.truthy?(1, [42])
    assert false == Solution.truthy?("hello", false)
    assert nil == Solution.truthy?("", nil)
  end
end
