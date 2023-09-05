defmodule Test do
  use ExUnit.Case

  describe "process register work" do
    test "list_registered work" do
      {:ok, _} = ProcessRegister.start_link()

      assert ProcessRegister.list_registered() == %{}
    end

    test "add work" do
      {:ok, _} = ProcessRegister.start_link()

      process = spawn(fn -> Process.sleep(:timer.seconds(10)) end)

      assert ProcessRegister.add(process, :some_process) == :ok
      assert %{some_process: ^process} = ProcessRegister.list_registered()

      second_process = spawn(fn -> Process.sleep(:timer.seconds(10)) end)

      assert ProcessRegister.add(second_process, :other_process) == :ok

      assert %{some_process: ^process, other_process: ^second_process} =
               ProcessRegister.list_registered()

      dead_process = spawn(fn -> 2 + 2 end)

      assert ProcessRegister.add(dead_process, :dead) == :ok

      assert %{some_process: ^process, other_process: ^second_process} =
               ProcessRegister.list_registered()
    end

    test "drop work" do
      {:ok, _} = ProcessRegister.start_link()

      process = spawn(fn -> Process.sleep(:timer.seconds(10)) end)

      ProcessRegister.add(process, :new_process)
      assert ProcessRegister.drop(:new_process) == :ok
      assert ProcessRegister.list_registered() == %{}

      assert ProcessRegister.drop(:not_existing_process) == :ok
    end
  end
end
