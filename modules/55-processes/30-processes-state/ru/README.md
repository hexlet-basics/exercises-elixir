
В прошлом упражнении мы создали процесс-калькулятор, который только обрабатывает входящие запросы, не храня никакого *состояния*. Но как его сохранить? Основная идея процесса, который обрабатывает более одного сообщения за раз, это вызов рекурсивной функции, которая продолжит основной цикл обработки сообщений. Рассмотрим пример с процессом-счетчиком:

```elixir
defmodule Counter do
  def init(parent, initial_state \\ 0) do
    process(parent, initial_state)
  end

  defp process(parent, state) do
    receive do
      :inc ->
        new_state = state + 1
        send(parent, {:ok, new_state})
        process(parent, new_state)

      :dec ->
        new_state = state - 1
        send(parent, {:ok, new_state})
        process(parent, new_state)

      :current ->
        send(parent, {:ok, state})
        process(parent, state)

      :reset ->
        send(parent, {:ok, 0})
        process(parent, 0)
    end
  end
end
```

В процессе-счетчике мы вынесли функцию запуска процесса, запомнили процесс-родитель и инициализировали состояние процесса-счетчика нулем. Затем при обработке сообщения изменяется состояние процесса, которое передается дальше в рекурсивный вызов функции `process`. Теперь запустим счетчик и проверим его работу:

Важно, что идентификатор родительского процесса мы передаем снаружи, так как вызов `self()` внутри модуля вернет иной идентификатор.

```elixir
parent = self()
counter = spawn(fn -> Counter.init(parent) end)

send(counter, :current)
# для просмотра почтового ящика родительского процесса
# далее по коду будет подразумеваться, что эта строчка кода
# будет вызываться после каждой отправки сообщения другому процессу
Process.info(parent, :messages)
# => {:messages, [ok: 0]}

send(counter, :inc)
# => {:ok, 1}
send(counter, :inc)
# => {:ok, 2}

send(counter, :dec)
# => {:ok, 1}

send(counter, :inc)
# => {:ok, 2}

send(counter, :reset)
# => {:ok, 0}

send(counter, :dec)
# => {:ok, -1}
```

Важно заметить, что каждый процесс хранит свое состояние *отдельно* от других процессов:

```elixir
parent = self()
first_counter = spawn(fn -> Counter.init(parent) end)
second_counter = spawn(fn -> Counter.init(parent) end)

send(first_counter, :inc)
send(first_counter, :inc)
send(first_counter, :inc)

send(second_counter, :dec)
send(second_counter, :dec)

send(first_counter, :current)
# => {:ok, 3}

send(second_counter, :current)
# => {:ok, -2}
```

Состояние не обязательно выражается числом, в него можно складывать что-угодно, начиная от чисел и заканчивая словарем со ссылками на другие процессы, к примеру.
