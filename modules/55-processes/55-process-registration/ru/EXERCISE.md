
Допишите агента, добавив функции `add`, `drop` для регистрации/снятия процессов с учета и функцию `list_registered`, которая выводит список процессов, которые зарегистрированы через агента. Если процесс завершился, то при вызове `add` регистрировать процесс не нужно. Если удаляемый процесс не существует, то нужно вернуть `:ok`, учтите, что `Process.unregister` вызывает исключение при попытке удалить несуществующий процесс.

```elixir
ProcessRegister.start_link()
# => {:ok, #PID<0.139.0>}

ProcessRegister.list_registered()
# => %{}

pid = spawn(fn -> Process.sleep(:timer.seconds(30)) end)
ProcessRegister.add(pid, :timeout_process)
# => :ok
pid = spawn(fn -> Process.sleep(:timer.seconds(30)) end)
ProcessRegister.add(pid, :other_timeout)
# => :ok
pid = spawn(fn -> Process.sleep(:timer.seconds(30)) end)
ProcessRegister.add(pid, :timeout)
# => :ok

ProcessRegister.list_registered()
# => %{
# =>   timeout: #PID<0.152.0>,
# =>   timeout_process: #PID<0.150.0>,
# =>   other_timeout: #PID<0.151.0>
# => }

Process.registered()
# => [..., :timeout, :timeout_process, :other_timeout, ...]

ProcessRegister.drop(:timeout_process)
# => :ok
ProcessRegister.list_registered()
# => %{
# =>   timeout: #PID<0.152.0>,
# =>   other_timeout: #PID<0.151.0>
# => }

Process.registered()
# => [..., :timeout, :other_timeout, ...]

  ProcessRegister.drop(:not_existing_process)
# => :ok
```

Синхронизацию состояния агента и регистра реализовывать не нужно.
