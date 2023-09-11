defmodule Test do
  use ExUnit.Case

  describe "solution genserver work" do
    test "initialization work" do
      {:ok, pid} = Solution.start_link()

      assert Process.alive?(pid)
    end

    test "current_state work" do
      {:ok, _} = Solution.start_link(%{test: "value"})

      assert Solution.current_state() == %{test: "value"}
    end

    test "reset work" do
      {:ok, _} = Solution.start_link(%{test: "value"})

      assert Solution.reset() == :ok
      assert Solution.current_state() == %{}
    end

    test "has? work" do
      {:ok, _} = Solution.start_link(%{test: "value"})

      assert Solution.has?(:test)
      refute Solution.has?(:some)
    end

    test "add work" do
      {:ok, _} = Solution.start_link(%{test: "value"})

      assert Solution.add(:some, 2) == :ok
      assert Solution.current_state() == %{test: "value", some: 2}
    end

    test "drop work" do
      {:ok, _} = Solution.start_link(%{test: "value"})

      assert Solution.drop(:some) == :ok
      assert Solution.current_state() == %{test: "value"}
      assert Solution.drop(:test) == :ok
      assert Solution.current_state() == %{}
    end
  end
end
