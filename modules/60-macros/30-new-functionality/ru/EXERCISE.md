
Создайте макрос `prohibit_words`, генерирующий функцию `forbidden?`, в который передается список запрещенных слов и проверяется, запрещено ли слово, переданное в функцию `forbidden?`. Если передано не слово, то функция возвращает `false`:

```elixir
defmodule Exercise
  require Solution

  Solution.prohibit_words(["hello", "world", "foo"])
end

Exercise.forbidden?("hello")
# => true
Exercise.forbidden?("test")
# => false
Exercise.forbidden?(1)
# => false
Exercise.forbidden?(%{hello: :world})
# => false
```
