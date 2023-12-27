
Создайте функцию `run_in_process`, которая принимает функцию и создает процесс, который выполняет эту функцию:

```elixir
Solution.run_in_process(fn -> String.upcase("code basics") end)
# => #PID<0.42.0>

Solution.run_in_process(fn -> Process.sleep(1000) end)
# => #PID<0.43.0>
```
