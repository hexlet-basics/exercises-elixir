
В этот раз допишите функции агента `Accumulator`, используя модуль `Task` и опираясь на модуль `Calculator`:
- `add` прибавить к состоянию аккумулятора переданное число;
- `sub` вычесть состояние аккумулятора на переданное число;
- `mul` умножить состояние аккумулятора на переданное число;
- `div` разделить состояние аккумулятора на переданное число;
- `reset` сбрасывает состояние `Accumulator` в ноль;
- `current` возвращает нынешнее состояние `Accumulator`.

```elixir
Accumulator.start_link(0)

Accumulator.add(10) # => :ok
Accumulator.current() # => 10

Accumulator.sub(2) # => :ok
Accumulator.current() # => 8

Accumulator.mul(2) # => :ok
Accumulator.current() # => 16

Accumulator.div(4) # => :ok
Accumulator.current() # => 4

Accumulator.reset() # => :ok
Accumulator.current() # => 0
```
