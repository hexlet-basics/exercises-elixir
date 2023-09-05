defmodule ProcessRegister do
  use Agent

  def start_link(initial_value \\ %{}) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  # BEGIN
  def add(process, name) when is_pid(process) do
    if registrable?(process, name) do
      Process.register(process, name)
      Agent.update(__MODULE__, fn state -> Map.put(state, name, process) end)
    end

    :ok
  end

  def drop(name) do
    try do
      Process.unregister(name)
      :ok
    rescue
      _ -> :ok
    after
      Agent.update(__MODULE__, fn state -> Map.delete(state, name) end)
    end
  end

  def list_registered() do
    Agent.get(__MODULE__, & &1)
  end

  defp registrable?(pid, name) do
    !Map.has_key?(list_registered(), name) && Process.alive?(pid)
  end

  # END
end
