defmodule Test do
  use ExUnit.Case

  describe "compare work" do
    test "with valid data" do
      assert Solution.compare(1, 1) == {:ok, :equal}
      assert Solution.compare(2, 1) == {:ok, :greater}
      assert Solution.compare(0, 1) == {:ok, :less}
    end

    test "with invalid data" do
      assert Solution.compare("", 1) == {:error, :not_number}
      assert Solution.compare(1, []) == {:error, :not_number}
      assert Solution.compare(%{}, []) == {:error, :not_number}
    end
  end
end
