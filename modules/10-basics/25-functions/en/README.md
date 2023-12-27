
At a glance, functions in Elixir are like ones in imperative languages. But that only seems true. They are different in many ways and that influences your code organization inside them a lot.

The easiest way to define a function is to use the construction _def/do/end_:

```elixir
def hello do
  IO.puts("Hello, World!")
end
```

If a function accepts no arguments, then we can omit brackets.

With arguments we write it the same way most of the languages has it:

```elixir
defmodule Math do
  # Write name in snake_case
  def sum_of_values(a, b) do
    # Basic sum
    a + b
  end
end

# We can call functions without brackets!
IO.puts Math.sum_of_values(5, 8) # => 13
```

In Elixir there's no instruction `return` that might stop code execution. The result of function execution is always the last expression result. If the function is empty then it returns _nil_ which is equal to _null_ in other languages.

Another feature is that we can call a function without brackets. But there is a trick: in nested calls, it might cause confusion and unexpected behavior: `IO.puts IO.puts "huh"`.

For one-liners Elixir supports a special short declaration syntax:

```elixir
# Note that we put a comma before _do_ and we omit _end_
def sum_of_values(a, b), do: a + b

# or

def hello, do: IO.puts("Hello, World!")
```

Functions defined with `def` are available outside of its module. If we want to make a private function we should define it using `defp`.

```elixir
defmodule Solution do
  # We can call the same module functions without specifying its module
  def hello, do: IO.puts(text_for_hello())

  defp text_for_hello, do: "Hello, World"
end
```
