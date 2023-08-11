defmodule Test do
  use ExUnit.Case

  describe "generate_pets work" do
    test "with valid input" do
      pets = Solution.generate_pets(10)

      assert is_list(pets)

      Enum.each(Enum.with_index(pets), fn {pet, index} ->
        assert is_struct(pet, Pet)
        assert pet.name == "Barkley #{index}"
      end)
    end

    test "with invalid input" do
      pets = Solution.generate_pets(-20)

      assert is_list(pets)
      assert Enum.empty?(pets)
    end
  end
end
