defmodule Solution do

  def get_values(data) do
    %{a: a_value, b: b_value} = data
    {a_value, b_value}
  end

  def get_value_by_key(data, key) do
    %{^key => value} = data
    value
  end
  
end
