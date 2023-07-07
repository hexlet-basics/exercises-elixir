defmodule Test do
  use ExUnit.Case

  test "zip realization" do
    assert Solution.zip([], []) == []
    assert Solution.zip([1, 2], [3, 4]) == [[1, 3], [2, 4]]
    assert Solution.zip([1, 2], []) == [[1, nil], [2, nil]]
    assert Solution.zip([], [3, 4]) == [[nil, 3], [nil, 4]]
    assert Solution.zip([1, 2], [3]) == [[1, 3], [2, nil]]
    assert Solution.zip([1], [3, 4]) == [[1, 3], [nil, 4]]
    assert Solution.zip([1, 2, 3, 4], [5, 6, 7, 8]) == [[1, 5], [2, 6], [3, 7], [4, 8]]
  end
end
