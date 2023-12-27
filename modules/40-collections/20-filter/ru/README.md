
Функция `map` может менять элементы списка, но не может менять их количество: сколько элементов было в исходном списке, столько же останется. Функция `filter` же, напротив, не может менять сами элементы, но может решать, какие из них попадут в выходной список, а какие будут отброшены.

```elixir
numbers = [12, 2, 30, 4, 55, 10, 11]

result = Enum.filter(numbers, fn (x) -> x >= 10 end)
IO.puts(result) # => [12, 30, 55, 10, 11]

result =
  numbers
  |> Enum.filter(fn (x) -> x < 20 end)
  |> Enum.filter(fn (x) -> rem(x, 2) == 0 end)
  |> IO.puts() # => [12, 2, 4, 10]

users = [%{name: "Igor", age: 21}, %{name: "John", age: 13}, %{name: "Alice", age: 20}, %{name: "Isabella", age: 13}]

result = Enum.filter(users, fn %{age: age} -> age < 15 end)
IO.puts(result) # => [%{age: 13, name: "John"}, %{age: 13, name: "Isabella"}]

result = Enum.filter(users, &(String.starts_with?(&1[:name], "Al")))
IO.puts(result) # => [%{age: 20, name: "Alice"}]
```
