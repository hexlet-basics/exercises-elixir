defmodule Test do
  use ExUnit.Case

  describe "calculator code unchanged" do
    test "adding" do
      assert Calculator.exec(:+, 2, 3) == 5
      assert Calculator.exec(:+, 10, 20) == 30
    end

    test "subtraction" do
      assert Calculator.exec(:-, 2, 3) == -1
      assert Calculator.exec(:-, 10, 20) == -10
    end

    test "multiply" do
      assert Calculator.exec(:*, 2, 3) == 6
      assert Calculator.exec(:*, 10, 20) == 200
    end

    test "division" do
      assert Calculator.exec(:/, 2, 3) == 0
      assert Calculator.exec(:/, 20, 10) == 2
    end
  end

  test "accumulator agent" do
    Accumulator.start_link(0)

    Accumulator.add(10)
    assert Accumulator.current() == 10
    Accumulator.add(3)
    assert Accumulator.current() == 13

    Accumulator.mul(10)
    assert Accumulator.current() == 130
    Accumulator.mul(3)
    assert Accumulator.current() == 390

    Accumulator.sub(10)
    assert Accumulator.current() == 380
    Accumulator.sub(3)
    assert Accumulator.current() == 377

    Accumulator.div(10)
    assert Accumulator.current() == 37
    Accumulator.div(3)
    assert Accumulator.current() == 12

    Accumulator.reset()
    assert Accumulator.current() == 0
    assert Agent.stop(Accumulator) == :ok
  end
end
