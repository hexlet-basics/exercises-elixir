
Создайте функцию `generate_pets`, в которую передается количество питомцев, список которых нужно сгенерировать с именем `Barkley x`, где `x` - идентификатор питомца (отсчет идет с нуля). Модуль `Pet` описан заранее. Опишите спецификацию созданной функции:

```elixir
Solution.generate_pets(2)
# => [%Pet{name: "Barkley 0"}, %Pet{name: "Barkley 1"}]

Solution.generate_pets(-2)
# => []
```
