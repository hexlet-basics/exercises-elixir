defmodule Solution do
  # BEGIN
  def join_and_upcase(str1, str2) do
    String.trim(String.upcase(str1 <> str2, :ascii))
  end

  # END
end
