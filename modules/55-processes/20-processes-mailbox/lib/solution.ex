defmodule Solution do
  # BEGIN
  def calculate(pid) do
    receive do
      {operation, args} ->
        send(pid, {:ok, exec(operation, args)})
        calculate(pid)

      {:exit} ->
        send(pid, {:ok, :exited})
    end
  end

  defp exec(:+, [first, second]) do
    first + second
  end

  defp exec(:-, [first, second]) do
    first - second
  end

  defp exec(:*, [first, second]) do
    first * second
  end

  # END
end
