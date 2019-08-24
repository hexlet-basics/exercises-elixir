defmodule ExercisesElixirTest do
  use ExUnit.Case
  doctest ExercisesElixir

  test "greets the world" do
    assert ExercisesElixir.hello() == :world
  end
end
