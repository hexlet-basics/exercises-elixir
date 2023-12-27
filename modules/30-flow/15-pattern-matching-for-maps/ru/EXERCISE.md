
Реализовать функцию `get_values(data)`, которая принимает словарь, извлекает из него два значения по ключам `:a` и `:b`, и возвращает их в виде кортежа `{a_value, b_value}`.

Реализовать функцию `get_value_by_key(data, key)`, которая принимает словарь и ключ, извлекает значение по указанному ключу и возвращает его.

Обе функции генерируют исключение `MatchError` если в словаре нет нужных ключей.

```elixir
Solution.get_values(%{a: 1, b: 2})
# => {1, 2}
Solution.get_values(%{a: :ok, b: 42, c: true})
# => {:ok, 42}

Solution.get_values(%{})
# => MatchError

Solution.get_value_by_key(%{answer: 42}, :answer)
# => 42
Solution.get_value_by_key(%{question: "6 * 7"}, :question)
# => "6 * 7"

Solution.get_value_by_key(%{a: 1}, :b)
# => MatchError
```
