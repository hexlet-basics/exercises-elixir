defmodule Solution do
  # BEGIN
  defmacro my_unless(condition, do: expression) do
    quote do
      if(!unquote(condition), do: unquote(expression))
    end
  end

  # END
end
