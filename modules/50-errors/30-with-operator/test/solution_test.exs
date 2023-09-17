defmodule Test do
  use ExUnit.Case

  describe "validate work" do
    test "with valid data" do
      assert Solution.validate("some") == {:ok, "some"}
      assert Solution.validate("hello!!") == {:ok, "hello!!"}
    end

    test "with invalid data" do
      assert Solution.validate(1) == {:error, :not_binary}
      assert Solution.validate("a") == {:error, :too_short}
      assert Solution.validate("hello, world!") == {:error, :too_long}
    end
  end
end
