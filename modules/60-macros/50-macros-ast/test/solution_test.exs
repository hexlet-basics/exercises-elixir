defmodule Test do
  use ExUnit.Case

  describe "collect_module_stats work" do
    test "when no function defined" do
      new_module = """
        defmacro MyModule do
          require Integer

          @some_attr "1"

          defmacro no_interference do
            quote do: a = 1
          end
        end
      """

      assert Solution.collect_module_stats(new_module) == []
    end

    test "when few functions defined" do
      new_module = """
        defmacro MyModule do
          def hello() do
            "world"
          end

          def test(a, b) do
            a + b
          end
        end
      """

      assert Solution.collect_module_stats(new_module) == [
               %{arity: 2, name: :test},
               %{arity: 0, name: :hello}
             ]
    end

    test "when few functions and protocols defined" do
      new_module = """
        defmacro MyModule do
          def hello(string) do
            [string, "world"]
          end

          def magic(a, b, c) do
            (a + b) * c
          end

          defp test(a, b) do
            a + b
          end
        end
      """

      assert Solution.collect_module_stats(new_module) == [
               %{arity: 2, name: :test},
               %{arity: 3, name: :magic},
               %{arity: 1, name: :hello}
             ]
    end
  end
end
