
Создайте функцию `collect_module_stats` принимающую строку, в которой определяется модуль и функции модуля, а затем подсчитывается статистика по функциям, определенные внутри модуля.

Для начала, изучите функцию `string_to_quoted` модуля `Code` и функцию `prewalk` из модуля `Macro`. Формат собираемой статистики представлен в примерах:

```elixir
new_module = """
  defmodule MyModule do

  end
"""

Solution.collect_module_stats(new_module)
# => []

new_module = """
  defmodule MyModule do
    def hello() do
      "world"
    end
  end
"""

Solution.collect_module_stats(new_module)
# => [%{arity: 0, name: :hello}]

new_module = """
  defmodule MyModule do
    def hello() do
      "world"
    end

    defp test(a, b) do
      a + b
    end
  end
"""

Solution.collect_module_stats(new_module)
# => [%{arity: 2, name: :test}, %{arity: 0, name: :hello}]

new_module = """
  defmodule MyModule do
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

Solution.collect_module_stats(new_module)
# => [%{arity: 2, name: :test}, %{arity: 3, name: :magic}, %{arity: 1, name: :hello}]
```
