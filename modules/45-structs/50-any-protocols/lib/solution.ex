defprotocol Teller do
  @spec say_something(any()) :: String.t()
  def say_something(someone)
end

defmodule Human do
  defstruct [:name]
end

defmodule Dog do
  defstruct [:name]
end

defmodule Cat do
  defstruct [:name]
end

defimpl Teller, for: Human do
  def say_something(_), do: "Hello, world!"
end

defimpl Teller, for: Dog do
  def say_something(_), do: "Bark, world!"
end

defimpl Teller, for: Cat do
  def say_something(_), do: "Meow, world!"
end

# BEGIN
defimpl Teller, for: Any do
  def say_something(_), do: "World!"
end

defmodule Robot do
  @derive [Teller]
  defstruct [:name]
end

# END
