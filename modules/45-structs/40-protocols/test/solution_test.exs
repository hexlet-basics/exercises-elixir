defmodule Test do
  use ExUnit.Case

  describe "teller protocol work" do
    test "for human" do
      assert Teller.impl_for(%Human{}) == Teller.Human
      assert Teller.say_something(%Human{name: "John"}) == "Hello, world!"
    end

    test "for dog" do
      assert Teller.impl_for(%Dog{}) == Teller.Dog
      assert Teller.say_something(%Dog{name: "Barkinson"}) == "Bark, world!"
    end

    test "for cat" do
      assert Teller.impl_for(%Cat{}) == Teller.Cat
      assert Teller.say_something(%Cat{name: "Meowington"}) == "Meow, world!"
    end
  end
end
