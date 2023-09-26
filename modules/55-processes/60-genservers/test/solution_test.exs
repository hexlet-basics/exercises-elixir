defmodule Test do
  use ExUnit.Case

  describe "solution genserver work" do
    test "initialization work" do
      {:ok, pid} = Solution.start_link()

      assert Process.alive?(pid)
      Process.exit(pid, :normal)
    end

    test "current_state work" do
      {:ok, pid} = Solution.start_link(%{test: "value"})

      assert Solution.current_state() == %{test: "value"}
      Process.exit(pid, :normal)
    end

    test "reset work" do
      {:ok, pid} = Solution.start_link(%{test: "value"})

      assert Solution.reset() == :ok
      assert Solution.current_state() == %{}
      Process.exit(pid, :normal)
    end

    test "has? work" do
      {:ok, pid} = Solution.start_link(%{test: "value"})

      assert Solution.has?(:test)
      refute Solution.has?(:some)
      Process.exit(pid, :normal)
    end

    test "add work" do
      {:ok, pid} = Solution.start_link(%{test: "value"})

      assert Solution.add(:some, 2) == :ok
      assert Solution.current_state() == %{test: "value", some: 2}
      Process.exit(pid, :normal)
    end

    test "drop work" do
      {:ok, pid} = Solution.start_link(%{test: "value"})

      assert Solution.drop(:some) == :ok
      assert Solution.current_state() == %{test: "value"}
      assert Solution.drop(:test) == :ok
      assert Solution.current_state() == %{}
      Process.exit(pid, :normal)
    end
  end
end
