defmodule Test do
  use ExUnit.Case

  test "concate and upcase" do
    res = Solution.concate_and_upcase(" привет ", "world!")
    assert res == "привет WORLD!"

    res = Solution.concate_and_upcase("hello ", "мир!  ")
    assert res == "HELLO мир!"

    res = Solution.concate_and_upcase("   hello ", "world!  ")
    assert res == "HELLO WORLD!"
  end
end
