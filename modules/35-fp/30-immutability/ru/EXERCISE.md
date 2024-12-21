
Реализуем [шифр Цезаря](https://ru.wikipedia.org/wiki/%D0%A8%D0%B8%D1%84%D1%80_%D0%A6%D0%B5%D0%B7%D0%B0%D1%80%D1%8F) -- простой способ шифрования путем сдвига каждого символа на константу.

Нужно реализовать функцию `encode/2`, которая принимает набор символов (`charlists`) и сдвиг, и возвращает зашифрованный набор символов (`charlists`).

```elixir
Solution.encode('Hello', 10)
# => 'Rovvy'
Solution.encode('Hello', 5)
# => 'Mjqqt'
```

Также нужно реализовать функцию `decode/2`, которая принимает зашифрованную набор символов (`charlists`) и сдвиг, и возвращает оригинальный набор символов (`charlists`).

```elixir
Solution.decode('Rovvy', 10)
# => 'Hello'
Solution.decode('Mjqqt', 5)
# => 'Hello'
```
