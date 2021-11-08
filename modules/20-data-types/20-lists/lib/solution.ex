defmodule Solution do
  # BEGIN
  def get_second_item(list) do
    [item1, item2 | _] = list
    item1 + item2
  end
  # END
end
