
В Elixir есть механизм исключений, однако используется он иначе, чем в классических языках программирования. Для начала ознакомимся с исключениями.

Исключения выбрасываются через `raise`:

```elixir
raise "Boom!"
# => ** (RuntimeError) Boom!
# =>    iex:149: (file)
```

Исключения создаются через `defexception`:

```elixir
defmodule MyError do
  defexception message: "boom!"
end

raise MyError
# => ** (MyError) boom!
# =>   iex:150: (file)

raise MyError, message: "different boom!"
# => ** (MyError) different boom!
# =>   iex:150: (file)
```

Исключения перехватываются через `try` и `rescue`:

```elixir
try do
  raise "boom!"
rescue
  e in RuntimeError -> e
end
# => %RuntimeError{message: "boom!"}

try do
  raise "boom!"
rescue
  RuntimeError -> "oops"
end
# => "oops"
```

Как уже было сказано, в мире Elixir используется философия "пусть сломается" (let it crash), из-за чего исключения при написании Elixir кода зачастую не обрабатываются. Почему? Из-за того, что Elixir код всегда исполняется в отдельных процессах (акторах), которые работают независимо. Поэтому падение одного из сотни или тысячи процессов никак не повлияет на работу всей системы. Про процессы (акторы) подробнее поговорим в следующем модуле, а пока продолжим изучать исключения.

Так как Elixir программисты зачастую игнорируют прямую обработку исключений, иногда бывает полезно поймать исключение, записать в логи информацию об ошибке и пробросить исключение дальше по стеку. Повторный выброс исключения происходит через `reraise`:

```elixir
require Logger

try do
  1 / 0
rescue
  e ->
    Logger.warning(Exception.format(:error, e, __STACKTRACE__))
    reraise e, __STACKTRACE__
end

 # => ** (ArithmeticError) bad argument in arithmetic expression: 1 / 0
 # =>   :erlang./(1, 0)
 # =>   iex:157: (file)
 # =>   iex:161: (file)

 # => 17:48:09.214 [warning] ** (ArithmeticError) bad argument in arithmetic expression
 # =>   :erlang./(1, 0)
 # =>   iex:157: (file)
 # =>   (elixir 1.15.0) src/elixir.erl:374: anonymous fn/4 in :elixir.eval_external_handler/1
 # =>   (stdlib 4.3.1.1) erl_eval.erl:748: :erl_eval.do_apply/7
 # =>   (stdlib 4.3.1.1) erl_eval.erl:987: :erl_eval.try_clauses/10
 # =>   (elixir 1.15.0) src/elixir.erl:359: :elixir.eval_forms/4
 # =>   (elixir 1.15.0) lib/module/parallel_checker.ex:112: Module.ParallelChecker.verify/1
 # =>   (iex 1.15.0) lib/iex/evaluator.ex:331: IEx.Evaluator.eval_and_inspect/3
```

По сути, исключения в Elixir используются по прямому назначению, они выбрасываются только когда произошло действительно что-то, чего в нормальной ситуации произойти не должно. В большинстве же остальных языков программирования исключения используются как еще один способ управлять потоком выполнения программы. Почти оператор `GOTO`, только замаскированный.

Иногда нужно подчистить какой-то ресурс, при возникновении исключения, тогда подойдет `after`:

```elixir
{:ok, file} = File.open("sample", [:utf8, :write])

try do
  IO.write(file, "hello")
  raise "oops"
after
  File.close(file)
end
```

Если же исключения не возникло, но нужно выполнить еще какой-то код, тогда подойдет `else`:

```elixir
x = 2

try do
  1 / x
rescue
  ArithmeticError ->
  :infinity
else
  y when y < 1 and y > -1 -> :small
  _ -> :large
end
# => :small
```
