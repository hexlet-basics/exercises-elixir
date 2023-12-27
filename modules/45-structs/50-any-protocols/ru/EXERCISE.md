
Продолжим упражнение из прошлого модуля, теперь опишите структуру `Robot` с явным указанием протокола `Teller` и реализуйте протокол для `Any` который возвращает строку `World!`:

```elixir
Teller.say_something(%Human{name: "John"}) # => "Hello, world!"
Teller.say_something(%Dog{name: "Barkinson"}) # => "Bark, world!"
Teller.say_something(%Cat{name: "Meowington"}) # => "Meow, world!"
Teller.say_something(%Robot{name: "Roberto"}) # => "World!"
```

Реализация для `Any` должна быть описана раньше, чем структуры.
