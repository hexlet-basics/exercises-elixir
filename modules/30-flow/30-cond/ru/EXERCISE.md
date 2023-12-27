
Реализовать функцию `single_win?(a_win, b_win)`, которая принимает 2 булевых параметра: `a_win` -- победил ли игрок A, и `b_win` -- победил ли игрок B. Функция возвращает `true` если победил только один из двоих игроков, иначе возвращает `false`.

Реализовать функцию `double_win?(a_win, b_win, c_win)`, которая принимает 3 булевых параметра для трех игроков. Если победили игроки A и B, то функция возвращает атом `:ab`. Если победили игроки A и C, то функция возвращает атом `:ac`, если победили игроки B и C, то функция возвращает атом `:bc`. Во всех остальных случаях функция возвращает `false`.

```elixir
Solution.single_win?(true, false)
# => true
Solution.single_win?(false, true)
# => true
Solution.single_win?(true, true)
# => false

Solution.double_win?(true, true, false)
# => :ab
Solution.double_win?(true, false, true)
# => :ac
Solution.double_win?(true, true, true)
# => false
Solution.double_win?(true, false, false)
# => false
```
