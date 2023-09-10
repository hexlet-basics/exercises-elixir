defmodule Solution do
  use GenServer

  def start_link(initial_state \\ %{}) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  def init(initial_state) do
    {:ok, initial_state}
  end

  # BEGIN
  # client
  def add(key, value) do
    GenServer.cast(__MODULE__, {:add, key, value})
  end

  def drop(key) do
    GenServer.cast(__MODULE__, {:drop, key})
  end

  def reset() do
    GenServer.cast(__MODULE__, :reset)
  end

  def current_state() do
    GenServer.call(__MODULE__, :current_state)
  end

  def has?(key) do
    GenServer.call(__MODULE__, {:has?, key})
  end

  # server
  def handle_call(:current_state, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:has?, key}, _from, state) do
    {:reply, Map.has_key?(state, key), state}
  end

  def handle_cast(:reset, _state) do
    {:noreply, %{}}
  end

  def handle_cast({:add, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_cast({:drop, key}, state) do
    {:noreply, Map.delete(state, key)}
  end

  # END
end
