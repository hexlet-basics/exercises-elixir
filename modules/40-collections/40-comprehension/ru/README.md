
Конструкторы списков являются еще одним способом работы с коллекциями, помимо классических `map`, `filter`, `reduce`.

```elixir
# пример map
users = [%{name: "Igor", age: 21}, %{name: "John", age: 13}, %{name: "Alice", age: 20}, %{name: "Isabella", age: 13}]

for %{name: name, age: age} <- users, do: "Name: #{name}, age: #{age}"
# => ["Name: Igor, age: 21", "Name: John, age: 13", "Name: Alice, age: 20", "Name: Isabella, age: 13"]

# пример filter
for %{age: age} = user <- users, age > 15, do: user
# => [%{age: 21, name: "Igor"}, %{age: 20, name: "Alice"}]

# комбинация map и filter
for %{name: name, age: age} <- users, age < 15, do: name
# => ["John", "Isabella"]
```

Конструкторы списков могут обрабатывать несколько списков одновременно:

```elixir
list1 = [1, 2, 3]
list2 = [:a, :b, :c]

for x <- list1, y <- list2, do: {x, y}
# => [
# => {1, :a},
# => {1, :b},
# => ...
# => {3, :b},
# => {3, :c}
# => ]
```

Элементы списков соединяются "каждый с каждым".

Коллекция может быть любой структурой данных, реализующей протокол `Enumerable`. Каждый элемент коллекции сопоставляется с шаблоном, и если не происходит совпадения, то этот элемент отбрасывается.

```elixir
# пример map
users = [%{name: "Igor"}, %{name: "John", age: 13}, %{name: "Alice"}, %{name: "Isabella", age: 13}]

for %{name: name, age: age} <- users, do: "Name: #{name}, age: #{age}"
# => ["Name: John, age: 13", "Name: Isabella, age: 13"]
```

В конструктор списков можно передать опцию `into`, которая позволяет добавить результат генератора списка в существующую коллекцию.

```elixir
result = %{a: 1, b: 2}

for {k, v} <- [{:c, 3}, {:d, 4}, {:name, "Igor"}], into: result, do: {k, v}
# => %{a: 1, b: 2, c: 3, d: 4, name: "Igor"}
```
