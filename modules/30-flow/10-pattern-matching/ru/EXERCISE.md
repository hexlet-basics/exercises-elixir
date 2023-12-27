
Реализуйте функцию `get_age(user)`, которая принимает объект `user`, представленный в виде кортежа `{:user, name, age}`, и возвращает возраст (age).

Реализуйте функцию `get_names(users)`, которая принимает список из трёх объектов `user`, представленных такими же кортежами, и возвращает список из трёх имен.

```elixir
bob = {:user, "Bob", 42}
helen = {:user, "Helen", 20}
kate = {:user, "Kate", 22}

Solution.get_age(bob) # => 42
Solution.get_age(helen) # => 20
Solution.get_age(kate) # => 22

Solution.get_names([bob, helen, kate])
# => ["Bob", "Helen", "Kate"]
```
