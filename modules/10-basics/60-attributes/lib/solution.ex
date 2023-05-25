defmodule Solution do
  defmacro __using__(_) do
    quote do
      # BEGIN
      @number_attr 10

      @boolean_attr false

      @hello_world_attr "Hello, World!"
      # END
    end
  end
end
