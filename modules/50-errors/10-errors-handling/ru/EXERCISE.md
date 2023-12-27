
Создайте функцию `my_div`, которая выбрасывает исключение `ArgumentError` с сообщением `Divide x by zero is prohibited!`, где `x` - первый переданный аргумент. Для деления с округлением воспользуйтесь `Integer.floor_div`:

```elixir
Solution.my_div(128, 2)
# => 64

Solution.my_div(128, 0)
# => ** (ArgumentError) Divide 128 by zero is prohibited!
# =>  iex:142: Solution.my_div/2
# =>  iex:149: (file)

Solution.my_div(10, 0)
# => ** (ArgumentError) Divide 10 by zero is prohibited!
# =>  iex:142: Solution.my_div/2
# =>  iex:149: (file)
```
