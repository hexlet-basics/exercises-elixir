defmodule Pet do
  @type pet :: %__MODULE__{name: String.t()}

  defstruct name: "Barkley"
end

defmodule Solution do
  # BEGIN
  @spec generate_pets(integer()) :: list(Pet.t()) | list()
  def generate_pets(amount) when amount > 0 do
    0..(amount - 1) |> Enum.map(fn id -> %Pet{name: "Barkley #{id}"} end)
  end

  def generate_pets(_), do: []

  # END
end
