defmodule Test do
  use ExUnit.Case

  test "calculator process work" do
    parent = self()
    calculator = spawn(fn -> Solution.calculate(parent) end)

    send(calculator, {:+, [2, 5]})
    assert_receive({:ok, 7})
    assert Process.alive?(calculator)

    send(calculator, {:*, [2, 5]})
    assert_receive({:ok, 10})
    assert Process.alive?(calculator)

    send(calculator, {:-, [2, 5]})
    assert_receive({:ok, -3})
    assert Process.alive?(calculator)

    send(calculator, {:exit})
    assert_receive({:ok, :exited})
    refute Process.alive?(calculator)
  end
end
