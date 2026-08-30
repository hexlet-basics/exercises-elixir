
Если из конструкции _case_ убрать шаблоны, но оставить охранные выражения, то получится конструкция _cond_.

Было:

```elixir
case Expr do
  Pattern1 [when GuardSequence1] ->
      Body1
  ...
  PatternN [when GuardSequenceN] ->
      BodyN
end
```

Стало:

```elixir
cond do
  GuardSequence1 ->
      Body1
  ...
  GuardSequenceN ->
      BodyN
end
```

В принципе, это эквивалент цепочки `if...else if`, которая нередко встречается в императивных языках. Python, например:

```python
a = int(input())
if a < -5:
    print('Low')
elif -5 <= a <= 5:
    print('Mid')
else:
    print('High')
```

Как и в конструкции _case_, очередность выражений важна. И если ни одно из выражений не вычислилось в true, то возникает исключение.

```elixir
def my_fun(num) do
  cond do
    num > 10 -> IO.puts("more than 10")
    num > 5 -> IO.puts("more than 5")
  end
end

my_fun(20) # => more than 10
my_fun(8) # => more than 5
my_fun(3) # ** (CondClauseError) no cond clause evaluated to a truthy value
```

## Конструкция if

В Эликсир есть привычная всем конструкция _if_:

```elixir
def gcd(a, b) do
  if rem(a, b) == 0 do
    b
  else
    gcd(b, c)
  end
end
```

Только это не настоящая конструкция языка, а макрос. Впрочем, в Эликсир очень многое является макросами. В некоторых случаях это важно знать, в некоторых не важно.

Есть и конструкция _unless_, тоже макрос:

```elixir
def gcd(a, b) do
  unless rem(a, b) != 0 do
    b
  else
    gcd(b, c)
  end
end
```

Есть важное отличие от императивных языков -- в функциональных языках _if_ всегда возвращает какое-то значение.

```elixir
a = 5
b = 10
c = if a > b do
  a
  else
  b
end

IO.puts(c)
# => 10
```

Некоторые функциональные языки требуют, чтобы часть _else_ всегда присутствовала, потому что значение нужно вернуть в любом случае, выполняется условие _if_ или не выполняется. Эликсир этого не требует:

```elixir
c = if a > b do
  a
end

IO.puts(c) # => nil
```
