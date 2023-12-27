
Создайте функцию `calculate` которая принимает процесс-получатель и поддерживает операции `:+`, `:-`, `:*` в виде сообщений от процесса и при обработке возвращает сообщение процессу отправителю с результатом, функция должна поддерживать постоянную обработку сообщений. При передаче сообщения `:exit`, функция перестает обрабатывать входящие сообщения:

```elixir
parent = self()
calculator = spawn(fn -> Solution.calculate(parent) end)

send(calculator, {:+, [2, 5]})
receive do
  {:ok, result} -> result
end
# => 7
Process.alive?(calculator)
# => true

send(calculator, {:*, [2, 5]})
receive do
  {:ok, result} -> result
end
# => 10
Process.alive?(calculator)
# => true

send(calculator, {:exit})
receive do
  {:ok, result} -> result
end
# => :exited
Process.alive?(calculator)
# => false
```
