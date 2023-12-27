
Как было описано в прошлом упражнении, в Elixir не используют исключения напрямую для обработки ошибок и управлением работы программы. Вместо этого из функций возвращают кортежи, если операция была успешна, то `{:ok, result}`, где `result` - результат выполнения функции. В случае ошибки возвращается кортеж вида `{:error, reason}` - где `reason` причина ошибки, может быть любого формата. Рассмотрим примеры:

```elixir
File.copy("/not_existing_dir",  "/existing_dir")
# => {:error, :enoent}
File.copy("/some_dir",  "/existing_dir")
# => {:ok, 210}
```

Важно отметить, что для булевых функций, лучше возвращать не кортеж, а `true` или `false`.

При таком подходе к обработке ошибок, органично использовать паттерн-матчинг:

```elixir
defmodule Example do
  @magic_number 10

  def multiply_by_two(number) when is_integer(number) do
    {:ok, number * 2}
  end

  def multiply_by_two(number) do
    {:error, :not_number}
  end

  def magic(number) do
    case multiply_by_two(number) do
      {:ok, result} -> {:ok, result + @magic_number}
      {:error, reason} -> {:error, :no_magic_here}
    end
  end
end

Example.multiply_by_two(2)
# => {:ok, 4}
Example.multiply_by_two("string")
# => {:error, :not_number}

Example.magic(2)
# => {:ok, 4}
Example.magic("string")
# => {:error, :no_magic_here}
```

Для простых функций не обязательно возвращать кортеж `{:ok, result}`, достаточно вернуть только `result`. Однако если функция в разных условиях возвращает разный результат, например, словарь с разным набором ключей, тогда лучше использовать кортежи и точнее паттерн-матчить их.
