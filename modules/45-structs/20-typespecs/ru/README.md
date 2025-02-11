
Для продолжения обсуждения `протоколов` и `поведения`, нам нужно ознакомиться с типизацией в Elixir.

Elixir - динамически типизированный язык, поэтому все типы в Elixir проверяются во время выполнения. Тем не менее Elixir поставляется со *спецификациями*, которые представляют собой нотацию, используемую для:

- объявления типизированных сигнатур функций (также называемых спецификациями);
- объявления пользовательских типов.

Спецификации полезны для документации кода и статического анализа кода, например, Dialyzer в Erlang или Dialyxir для Elixir.

Elixir предоставляет множество встроенных типов, таких как `integer` или `pid`, которые используются для документирования сигнатур функций. Например, функция round/1, которая округляет число до ближайшего целого. Как видно из документации, [типизированная сигнатура функции round/1](https://hexdocs.pm/elixir/Kernel.html#round/1) имеет вид:

```elixir
round(number()) :: integer()
```

Синтаксис состоит в том, что слева от :: указывается функция и ее входные данные, а справа - тип возвращаемого значения. Типы могут не содержать круглых скобок.

В коде спецификации функций записываются с помощью атрибута `@spec`, который располагается перед определением функции. В спецификациях могут описываться как публичные, так и частные функции. Имя функции и количество аргументов, используемых в атрибуте `@spec`, должны соответствовать описываемой функции:

```elixir
defmodule Example do

  @spec substract(integer, integer) :: integer
  def substract(first, second) do
    first - second
  end

  @spec inc_list(list(integer)) :: list(integer)
  def inc_list(numbers) do
    numbers |> Enum.map(&(&1 + 1))
  end

  @spec magic(boolean) :: integer | String.t
  def magic(do_magic \\ true) do
    if do_magic, do: 2, else: "hello"
  end
end
```

Определение пользовательских типов может помочь передать замысел вашего кода и повысить его читаемость. Пользовательские типы могут быть определены в модулях с помощью атрибута `@type`.

Примером реализации пользовательского типа является предоставление более описательного псевдонима существующего типа. Например, определение `year` в качестве типа делает спецификации функций более описательными, чем если бы они использовали просто `integer`:

```elixir
defmodule User do
  @typedoc """
  A 4 digit year, e.g. 1984
  """
  @type year :: integer

  @spec current_age(year) :: integer
  def current_age(year_of_birth), do: # implementation
end
```

Пользовательские типы могут быть и сложнее, например:

```elixir
@type error_map :: %{
  message: String.t,
  line_number: integer
}
```

Пользовательские типы можно использовать внутри других модулей:

```elixir
defmodule Errors do
  @type error_map :: %{
    message: String.t,
    line_number: integer
  }
end

defmodule Magic do

  @spec do_magic(integer) :: integer | Errors.error_map
  def do_magic(a) when is_integer(a) do
    Enum.random(1..100)
  end

  def do_magic(_) do
    %{message: "Incorrect argument", line_number: Enum.random(1..100)}
  end
end
```
