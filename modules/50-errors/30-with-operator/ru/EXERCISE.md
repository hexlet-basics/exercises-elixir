
Реализуйте функцию `validate`, которая проверяет переданный аргумент на следующие условия:
- аргумент является строкой
- длина строки меньше или равна 8
- длина строки больше или равна 2

Примеры работы функции:

```elixir
Solution.validate("some")
# => {:ok, "some"}
Solution.validate("hello!!")
# => {:ok, "hello!!"}

Solution.validate(1)
# => {:error, :not_binary}
Solution.validate("a")
# => {:error, :too_short}
Solution.validate("hello, world!")
# => {:error, :too_long}
```
