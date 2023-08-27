defmodule Test do
  use ExUnit.Case

  test "foobar supervisor work" do
    result = Solution.supervise_foobar(1)

    assert Enum.count(String.split(result)) == 47

    assert result ==
             "Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar"

    assert Solution.supervise_foobar(101) == ""
    assert Solution.supervise_foobar(-123) == ""
    assert Solution.supervise_foobar(0) == ""
  end
end
