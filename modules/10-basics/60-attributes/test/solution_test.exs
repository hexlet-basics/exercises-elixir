defmodule Test do
  use ExUnit.Case
  use Solution

  test "solution module attributes" do
    assert @number_attr == 10
    refute @boolean_attr
    assert @hello_world_attr = "Hello, World!"
  end
end
