
Определите три структуры `Human`, `Dog` и `Cat` с полем `name`. Затем определите функцию `say_something` для протокола `Teller` для каждого из модулей, которая возвращает строку в зависимости от типа:
- Для Human `Hello, world!`
- Для Cat `Meow, world!`
- Для Dog `Bark, world!`

```elixir
Teller.say_something(%Human{name: "John"}) # => "Hello, world!"
Teller.say_something(%Dog{name: "Barkinson"}) # => "Bark, world!"
Teller.say_something(%Cat{name: "Meowington"}) # => "Meow, world!"
```
