defmodule Solution do
  # BEGIN
  @operations %{"+" => &(&1 + &2), "-" => &(&1 - &2), "*" => &(&1 * &2), "/" => &(&1 / &2)}

  def calculate(operation, arg1, arg2) do
    Map.get(@operations, operation).(arg1, arg2)
  end

  # END
end
