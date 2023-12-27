
Создайте макрос `with_logging`, который принимает функцию, логгирует результат выполнения и возвращает результат. Примеры использования:

```elixir
defmodule Exercise
  require Solution

  def run_fn(function) do
    Solution.with_logging do
      function
    end
  end
end

Exercise.run_fn(fn -> 1 + 5 end)
# => Started execution...
# => Execution result is: 6
# => 6


Exercise.run_fn(fn -> %{hello: :world} end)
# => Started execution...
# => Execution result is: %{hello: :world}
# => %{hello: :world}
```
