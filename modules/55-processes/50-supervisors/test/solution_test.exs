defmodule Test do
  use ExUnit.Case

  describe "incrementor code unchanged" do
    test "current_value work" do
      Incrementor.start_link()

      assert Incrementor.current_value() == 0
    end

    test "run work" do
      Incrementor.start_link()

      Incrementor.run()
      assert Incrementor.current_value() == 1

      Incrementor.run()
      assert Incrementor.current_value() == 2
    end
  end

  describe "decrementor code unchanged" do
    test "current_value work" do
      Decrementor.start_link()

      assert Decrementor.current_value() == 0
    end

    test "run work" do
      Decrementor.start_link()

      Decrementor.run()
      assert Decrementor.current_value() == -1

      Decrementor.run()
      assert Decrementor.current_value() == -2
    end
  end

  describe "solution supervisor work" do
    test "initialization work" do
      {:ok, pid} = Solution.start_link()

      assert [
               {Decrementor, _, :worker, [Decrementor]},
               {Incrementor, _, :worker, [Incrementor]}
             ] = Supervisor.which_children(pid)

      assert Supervisor.count_children(pid) == %{active: 2, workers: 2, supervisors: 0, specs: 2}
    end

    test "restart straregy" do
      {:ok, pid} = Solution.start_link()

      Decrementor.run()
      assert Decrementor.current_value() == -1

      Incrementor.run()
      assert Incrementor.current_value() == 1

      Process.exit(Process.whereis(Decrementor), :kill)
      Supervisor.restart_child(pid, Process.whereis(Decrementor))
      assert Supervisor.count_children(pid) == %{active: 2, workers: 2, supervisors: 0, specs: 2}
      assert Decrementor.current_value() == 0
      assert Incrementor.current_value() == 1

      Process.exit(Process.whereis(Incrementor), :kill)
      Supervisor.restart_child(pid, Process.whereis(Incrementor))
      assert Supervisor.count_children(pid) == %{active: 2, workers: 2, supervisors: 0, specs: 2}
      assert Decrementor.current_value() == 0
      assert Incrementor.current_value() == 0
    end
  end
end
