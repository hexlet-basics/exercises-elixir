Реализовать функцию `join_game(user)`, которая принимает игрока в виде кортежа `{:user, name, age, role}` и определяет, разрешено ли данному игроку подключиться к игре. Если игроку уже исполнилось 18 лет, то он может войти в игру. Если роль игрока `:admin` или `:moderator`, то он может войти в игру независимо от возраста. Функция должна вернуть `:ok` или `:error`.

Реализовать функцию `move_allowed?(current_color, figure)` которая определяет, разрешено ли данной шахматной фигуре сделать ход. Параметр `current_color` может быть либо `:white` либо `:black`, и он указывает, фигурам какого цвета разрешено сделать ход. Параметр `figure` представлен кортежем `{type, color}`, где `type` может быть один из: `:pawn`, `:rook`, `:bishop`, `:knight`, `:queen`, `:king`, а color может быть `:white` или `:black`. Фигура может сделать ход если её тип `:pawn` или `:rook` и её цвет совпадает с `current_color`. Функция должна вернуть `true` или `false`.

```elixir
Solution.join_game({:user, "Bob", 17, :admin})
# => :ok
Solution.join_game({:user, "Bob", 17, :moderator})
# => :ok
Solution.join_game({:user, "Bob", 17, :member})
# => :error

Solution.move_allowed?(:white, {:pawn, :white})
# => true
Solution.move_allowed?(:black, {:pawn, :white})
# => false
```
