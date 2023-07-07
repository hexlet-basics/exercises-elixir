defmodule Test do
  use ExUnit.Case
  import Solution

  test "encode/decode" do
    assert encode(~c"Hello", 10) |> decode(10) == ~c"Hello"
    assert encode(~c"12345", 1) == ~c"23456"
    assert decode(~c"12345", 1) == ~c"01234"
    assert encode(~c"abcdef", 2) == ~c"cdefgh"
    assert decode(~c"abcdef", 2) == ~c"_`abcd"
  end

  test "encode/decode with cyrillic symbols" do
    assert encode(~c"Привет", 10) |> decode(10) == ~c"Привет"
    assert encode(~c"Привет мир", 500) |> decode(500) == ~c"Привет мир"
  end
end
