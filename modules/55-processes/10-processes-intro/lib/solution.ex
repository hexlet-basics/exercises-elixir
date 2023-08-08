defmodule Solution do
  # BEGIN
  def run_in_process(function) do
    spawn(function)
  end

  # END
end
