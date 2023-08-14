defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t()) :: {:ok, any} | {:error, atom}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t()]
end

defmodule TextParser do
  @behaviour Parser

  # BEGIN
  @impl Parser
  def parse(""), do: {:error, :no_text}
  def parse(text), do: {:ok, String.split(text, "\n")}

  @impl Parser
  def extensions(), do: [".txt"]
  # END
end
