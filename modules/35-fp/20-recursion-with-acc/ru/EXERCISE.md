
В функции `filter_adults/1` критерием фильтрации является возраст пользователя. Но этот возраст явно указан в коде функции. Нужно реализовать функцию `filter_by_age/2`, которая принимает список пользователей и возраст.

```elixir
users = [
  {:user, 1, "Bob", 23},
  {:user, 2, "Helen", 20},
  {:user, 3, "Bill", 15},
  {:user, 4, "Kate", 14}
]

Solution.filter_by_age(users, 16) # [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}]
Solution.filter_by_age(users, 14) # [{:user, 1, "Bob", 23}, {:user, 2, "Helen", 20}, {:user, 3, "Bill", 15}]
Solution.filter_by_age(users, 22) # [{:user, 1, "Bob", 23}]
```
