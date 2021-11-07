defmodule Solution do
  def concate_and_upcase(str1, str2) do
    String.trim(String.upcase(str1 <> str2, :ascii))
  end
end
