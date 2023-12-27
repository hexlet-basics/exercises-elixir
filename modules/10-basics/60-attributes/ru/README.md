
Иногда в модуле нужно вынести значения в константы. Для этого используются атрибуты, которые начинаются со знака `@`:

```elixir
defmodule MyModule do
  @magic_number 8

  def do_magic(num) do
    num * @magic_number
  end
end

MyModule.do_magic(10) # 80
```

Атрибуты модуля недоступны снаружи модуля:

```elixir
defmodule MyModule do
  @magic_number 8
end

MyModule.@magic_number # возникнет ошибка
```

Атрибуты можно объявлять несколько раз и перезаписывать. При этом стоит понимать, что компилятор подставляет последнее значение объявленного атрибута, например:

```elixir
defmodule MyModule do
  @magic_number 8

  def cast_magic() do
    @magic_number
  end

  @magic_number 0

  def do_magic() do
    @magic_number
  end
end

MyModule.cast_magic() # 8

MyModule.do_magic() # 0

# по сути после компиляции модуль будет выглядеть так
defmodule MyModule do
  @magic_number 8

  def cast_magic() do
    8
  end

  @magic_number 0

  def do_magic() do
    0
  end
end
```

Еще внутри модулей есть специальные атрибуты, которые используются эликсиром для генерации документации. Например, атрибут `@moduledoc`, в котором описывается общая информация о модуле, или `@doc`, которым документируется объявленная функция:

```elixir
defmodule MyModule do
  @moduledoc "My attributes exercise module."

  @magic_number 8

  @doc "Do some magic calculations."
  def do_magic(num) do
    num * @magic_number
  end
end
```

Затем эти атрибуты используются в генерации документации.

Еще с помощью специального объявления можно заставить атрибут модуля при перезаписи накапливаться, например:

 ```elixir
defmodule MyModule do
  Module.register_attribute __MODULE__, :magic_values, accumulate: true

  @magic_values 8
  @magic_values :some
  @magic_values "hello"

  def do_magic() do
    @magic_values
  end
end

MyModule.do_magic # [8, :some, "hello"]
```
