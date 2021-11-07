defmodule Solution do
  # BEGIN
  def keys_sum(map, key1, key2) do
    Map.get(map, key1, 0) + Map.get(map, key2, 0)
  end

  def keys_product(map, key1, key2) do
    Map.get(map, key1, 1) * Map.get(map, key2, 1)
  end

  def copy_key(from_map, to_map, key, default_value) do
    value = Map.get(from_map, key, default_value)
    Map.put(to_map, key, value)
  end
  # END
end
