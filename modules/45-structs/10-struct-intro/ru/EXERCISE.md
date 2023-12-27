
Создайте функцию `calculate_stats`, которая подсчитывает, сколько в списке людей и питомцев:

```elixir
users_and_pets = [%User{}, %User{}, %Pet{}]

Solution.calculate_stats(users_and_pets)
# => %{humans: 2, pets: 1}

Solution.calculate_stats([])
# => %{humans: 0, pets: 0}

only_pets = [%Pet{}, %Pet{}, %Pet{}]
# => %{humans: 0, pets: 3}
```

Обратите внимание, что структуры в модуле заранее определены.
