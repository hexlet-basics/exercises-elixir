
Реализуйте функцию `any?(a, b, c, d)`, которая принимает четыре булевых аргумента, и возвращает `true`, если среди аргументов есть `true`.

Реализуйте функцию `truthy?(a, b)`, которая принимает два аргумента любого типа, и если первый аргумент truthy, то функция возвращает второй аргумент.

```elixir
Solution.any?(false, false, false, false) # => false
Solution.any?(true, false, false, false) # => true
Solution.any?(false, true, false, true) # => true

Solution.truthy?(true, 42) # => 42
Solution.truthy?("hello", false) # => false
Solution.truthy?("", nil) # => nil
```
