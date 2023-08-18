defmodule CacheServer do
  # BEGIN
  def init(parent, initial_state \\ %{}) do
    process_requests(parent, initial_state)
  end

  defp process_requests(parent, state) do
    receive do
      {operation, args} ->
        {response, result, new_state} = exec(operation, args, state)
        send(parent, {response, result})
        process_requests(parent, new_state)

      {:exit} ->
        send(parent, {:ok, :exited})

      _ ->
        send(parent, {:error, :unrecognized_operation})
        process_requests(parent, state)
    end
  end

  defp exec(:put, {key, value}, state) do
    {:ok, value, Map.put(state, key, value)}
  end

  defp exec(:get, {key}, state) do
    if Map.has_key?(state, key) do
      value = Map.get(state, key)
      {:ok, value, state}
    else
      {:error, :not_found, state}
    end
  end

  defp exec(:drop, {key}, state) do
    new_state = Map.delete(state, key)
    {:ok, key, new_state}
  end

  defp exec(_, _, state) do
    {:error, :unrecognized_operation, state}
  end

  # END
end
