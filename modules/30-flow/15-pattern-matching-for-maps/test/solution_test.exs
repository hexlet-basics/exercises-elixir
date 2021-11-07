defmodule Test do
  use ExUnit.Case
  import Solution

  test "get_values test" do
    assert {1, 2} = get_values(%{a: 1, b: 2})
    assert {:ok, 42} = get_values(%{a: :ok, b: 42, c: true})
  end

  test "get_values invalid input test" do
    assert_raise MatchError, fn ->
      get_values(%{})
    end
  end

  test "get_value_by_key test" do
    assert 42 = get_value_by_key(%{answer: 42}, :answer)
    assert "6 * 7" = get_value_by_key(%{question: "6 * 7"}, :question)
  end

  test "get_value_by_key invalid input test" do
    assert_raise MatchError, fn ->
      get_value_by_key(%{a: 1}, :b)
    end
  end
end
