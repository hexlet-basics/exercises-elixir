
Реализуйте функцию `compare`, которая сравнивает два переданных *числа*:

```elixir
Solution.compare(2, 3)
# => {:ok, :less}
Solution.compare(3, 3)
# => {:ok, :equal}
Solution.compare(4, 3)
# => {:ok, :greater}

Solution.compare("", 3)
# => {:error, :not_number}
Solution.compare(2, [])
# => {:error, :not_number}
```
