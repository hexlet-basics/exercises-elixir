defmodule Test do
  use ExUnit.Case

  test "join and upcase works" do
    res = Solution.join_and_upcase(" привет ", "world!")
    assert res == "привет WORLD!"

    res = Solution.join_and_upcase("hello ", "мир!  ")
    assert res == "HELLO мир!"

    res = Solution.join_and_upcase("   hello ", "world!  ")
    assert res == "HELLO WORLD!"
  end
end
