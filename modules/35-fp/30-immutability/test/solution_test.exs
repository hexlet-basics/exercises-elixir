defmodule Test do
  use ExUnit.Case
  import Solution

  test "encode/decode" do
    assert encode('Hello', 10) |> decode(10) == 'Hello'
    assert encode('12345', 1) == '23456'
    assert decode('12345', 1) == '01234'
    assert encode('abcdef', 2) == 'cdefgh'
    assert decode('abcdef', 2) == '_`abcd'
  end

  test "encode/decode with cyrillic symbols" do
    assert encode('Привет', 10) |> decode(10) == 'Привет'
    assert encode('Привет мир', 500) |> decode(500) == 'Привет мир'
  end
  
end
