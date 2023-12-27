
В этот раз создайте процесс кеш-сервер, который хранит в состоянии словарь. Напишите функцию `init`, которая принимает родительский процесс и начальное состояние (как в примерах выше). Затем добавьте обработку следующих сообщений:
- `:put` положить по переданному ключу `key` значение `value` в состояние кеш-сервера, возвращает кортеж `{:ok, value}`;
- `:get` достать из состояния процесса значение по переданному ключу, при отсутствии значения вернуть кортеж `{:error, :not_found}`;
- `:drop` убрать из состояния процесса переданный ключ;
- `:exit` перестать обрабатывать входящие сообщения кеш-сервером, возвращает кортеж `{:ok, :exited}`;
- а еще добавьте обработку невалидных сообщений, чтобы процесс не ломался, если ему передать что-то не то (вернуть кортеж `{:error, :unrecognized_operation}`).

```elixir
parent = self()
cache_server = spawn(fn -> CacheServer.init(parent) end)

send(cache_server, {:put, {:hello, "world"}})
# => {:ok, "world"}

send(cache_server, {:get, {:hello}})
# => {:ok, "world"}

send(cache_server, {:get, {:some}})
# => {:error, :not_found})

send(cache_server, {:drop, {:hello}})
# => {:ok, :hello}

send(cache_server, {:get, {:hello}})
# => {:error, :not_found})

send(cache_server, {:something, {1, 2, 3}})
# => {:error, :unrecognized_operation}
Process.alive?(cache_server)
# => true

send(cache_server, :boom)
# => {:error, :unrecognized_operation}
Process.alive?(cache_server)
# => true

send(cache_server, {:exit})
# => {:ok, :exited}
Process.alive?(cache_server)
# => false
```
