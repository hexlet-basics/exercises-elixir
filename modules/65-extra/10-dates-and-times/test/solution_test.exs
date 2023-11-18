defmodule Test do
  use ExUnit.Case

  describe "shift_days work" do
    test "with Date" do
      time = Date.utc_today()

      assert Date.add(time, -2) == Solution.shift_days(time, -2)
      assert Date.add(time, 2) == Solution.shift_days(time, 2)
      assert Date.add(time, 1) == Solution.shift_days(time, 1)
      assert Date.add(time, 0) == Solution.shift_days(time, 0)
    end

    test "with NaiveDateTime" do
      time = NaiveDateTime.utc_now()

      assert NaiveDateTime.add(time, -2, :day) == Solution.shift_days(time, -2)
      assert NaiveDateTime.add(time, 2, :day) == Solution.shift_days(time, 2)
      assert NaiveDateTime.add(time, 1, :day) == Solution.shift_days(time, 1)
      assert NaiveDateTime.add(time, 0, :day) == Solution.shift_days(time, 0)
    end

    test "with DateTime" do
      time = DateTime.utc_now()

      assert DateTime.add(time, -2, :day) == Solution.shift_days(time, -2)
      assert DateTime.add(time, 2, :day) == Solution.shift_days(time, 2)
      assert DateTime.add(time, 1, :day) == Solution.shift_days(time, 1)
      assert DateTime.add(time, 0, :day) == Solution.shift_days(time, 0)
    end

    test "with Time" do
      time = Time.utc_now()

      assert Time.add(time, -48, :hour) == Solution.shift_days(time, -2)
      assert Time.add(time, 48, :hour) == Solution.shift_days(time, 2)
      assert Time.add(time, 24, :hour) == Solution.shift_days(time, 1)
      assert Time.add(time, 0, :hour) == Solution.shift_days(time, 0)
    end
  end
end
