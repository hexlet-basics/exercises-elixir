
Генсерверы являются основным строительным кирпичиком OTP. Генсервер - это процесс, который может хранить состояние, выполнять какой-либо код, не обязательно синхронно и т.д. Отличие обычных процессов от обобщенных серверных процессов (general servers)  в том, что разработчики OTP заранее подготовили все необходимое, что зачастую нужно для работы с процессом. Например, обработка ошибок, написание функций обратного вызова, встраивание в дерево супервизии.

Возникает вопрос, а в чем разница между `Agent` и `GenServer`, ведь с первого взгляда они делают одно и то же. Разница в том, что абстракция `Agent` построена на основе `GenServer`, например в `Agent` управление состоянием происходит через функцию `Agent.update`, в то время как у `GenServer` состоянием нужно управлять вручную. Абстракция агентов построена вокруг какого-либо *состояния*, в то время как генсервер может и не обладать состоянием, а только выполнять какую-либо работу.

На самом деле, в первых упражнениях мы уже написали некоторое подобие генсервера, которое работает по схеме:

```text
_______________         _____________
|client module|    <->  |server call|
---------------         -------------
                             ^
                             |
                             v
__________________      _____________
|server callbacks| <->  |server loop|
------------------      -------------
```

Модуль клиент и вызов сервера работают в потоке клиента, цикл сервера и его функции обратного вызова работают в потоке сервера. По сути так и работает генсервер. Теперь рассмотрим, как будет выглядеть счетчик генсервер:

```elixir
defmodule Counter do
  use GenServer

  def init(initial_state \\ 0) do
    {:ok, initial_state}
  end

  def current, do: GenServer.call(__MODULE__, :current)
  def inc, do: GenServer.cast(__MODULE__, :inc)
  def dec, do: GenServer.cast(__MODULE__, :dec)

  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:inc, state) do
    {:noreply, state + 1}
  end

  def handle_cast(:dec, state) do
    {:noreply, state - 1}
  end
end
```

И проверим счетчик в работе:

```elixir
# создаем и регистрируем процесс генсервер
GenServer.start_link(Counter, 0, name: Counter)
# => {:ok, #PID<0.115.0>}

Counter.current()
# => 0

Counter.inc()
# => :ok
Counter.inc()
# => :ok
Counter.inc()
# => :ok
Counter.current()
# => 3

Counter.dec()
# => :ok
Counter.dec()
# => :ok
Counter.current()
# => 1
```

Как и в случае с агентами, внутри генсервера мы описываем функции для клиентской части и серверной, вызов серверной части происходит во время обработки сообщения процесса генсервера, а конкретнее в функциях обратного вызова `handle_call`, `handle_cast` и `handle_info`. Эти функции действую следующим образом:
- `handle_call` - синхронный обработчик сообщения, когда клиенту важен ответ от сервера и он блокируется, в ожидании оного;
- `handle_cast` - асинхронный обработчик сообщения, когда клиент не хочет блокироваться и ждать ответа от сервера;
- `handle_info` - низкоуровневый асинхронный обработчик, срабатывает когда сообщение серверу передается напрямую, а не через `GenServer.call`, `GenServer.cast`. Зачастую используется для внутренних задач генсервера, например по таймеру обнулять состояние генсервера или сделать http вызов. Еще можно использовать этот обработчик в качестве мониторинга за другим процессом через обработку сообщения `:DOWN`.

Так как `GenServer` является поведением, то мы можем перед описанием функции обратного вызова добавить аттрибут `@impl true`. Это позволит компилятору проверить сигнатуры описанных функций и что необходимые функции вообще реализованы. Подробнее про возвращаемые значения для функций обратных вызовов можно посмотреть в [официальной документации](https://hexdocs.pm/elixir/GenServer.html#c:handle_cast/2), либо в интерактивной консоли ввести следующую команду:

```elixir
iex(48)> b GenServer
@callback code_change(old_vsn, state :: term(), extra :: term()) ::
            {:ok, new_state :: term()} | {:error, reason :: term()}
          when old_vsn: term() | {:down, term()}

@callback format_status(reason, pdict_and_state :: list()) :: term()
          when reason: :normal | :terminate

@callback handle_call(request :: term(), from(), state :: term()) ::
            {:reply, reply, new_state}
            | {:reply, reply, new_state,
              timeout() | :hibernate | {:continue, continue_arg :: term()}}
            | {:noreply, new_state}
            | {:noreply, new_state,
              timeout() | :hibernate | {:continue, continue_arg :: term()}}
            | {:stop, reason, reply, new_state}
            | {:stop, reason, new_state}
          when reply: term(), new_state: term(), reason: term()
# ..............
```

Важно понимать, что обработчики `handle_call`, `handle_cast` и `handle_info` при определении завязываются на конкретные сообщения, которые они обрабатывают, поэтому важно описать паттерн catch all, который перехватит сообщения, которые генсервер не знает как обработать. Если же не описать обобщенный вариант обработки сообщения, то процесс генсервер аварийно завершится при таком вызове:

```elixir
GenServer.call(Counter, :do_something_different)
# => 15:30:36.108 [error] GenServer Counter terminating
# => ** (FunctionClauseError) no function clause matching in Counter.handle_call/3
# =>   iex:12: Counter.handle_call(:do_something_different, {#PID<0.109.0>, [:alias | #Reference<0.0.13955.4010078260.1056243713.84046>]}, 0)
# =>   (stdlib 5.0.2) gen_server.erl:1113: :gen_server.try_handle_call/4
# =>   (stdlib 5.0.2) gen_server.erl:1142: :gen_server.handle_msg/6
# =>   (stdlib 5.0.2) proc_lib.erl:241: :proc_lib.init_p_do_apply/3
```

Поэтому допишем общие обработчики, которые перехватят любое сообщение:

```elixir
defmodule Counter do
  use GenServer

  def init(initial_state \\ 0) do
    {:ok, initial_state}
  end

  # other code...
  @impl true
  def handle_call(msg, _from, state) do
    IO.puts("handle_call intercept unknown message: #{inspect(msg)}")
    {:reply, {:error, :unknown_msg}, state}
  end

  @impl true
  def handle_cast(msg, state) do
    IO.puts("handle_cast intercept unknown message: #{inspect(msg)}")
    {:noreply, state}
  end
end
```

Теперь проверим в работе:

```elixir
GenServer.call(Counter, :some)
# => handle_call intercept unknown message: :some
# => {:error, :unknown_msg}

GenServer.cast(Counter, :some)
# => handle_cast intercept unknown message: :some
# => :ok

GenServer.call(Counter, :current)
# => 0
```

В случае с `handle_info` нет необходимости отдельно прописывать функцию обратного вызова, так как она добавляется при вызове `use GenServer`:

```elixir
send(Counter, :my_msg)
# => :my_msg
# => 15:57:56.871 [error] Counter Counter received unexpected message in handle_info/2: :my_msg
# однако процесс не завершился

Process.alive?(Process.whereis(Counter))
# => true
```

Помимо предотвращения аварийных ситуаций, общий шаблон обработки сообщений не позволит почтовому ящику генсервера переполнится, так как в BEAM нет никаких ограничений на количество сообщений в ящике процесса. А сообщения, под которые нет общих обработчиков продолжат висеть в очереди почтового ящика до тех пор, пока память не переполнится и не сработает OOM-killer операционной системы, который аварийно завершит весь узел BEAM. Однако, иногда переполнение может возникнуть из-за медленной скорости обработки сообщений, в таких случаях используют пул генсерверов, которые будут вести обработку сообщений параллельно.

Есть еще обработчик `terminate`, он срабатывает при завершении генсервера, например, в этом обработчике можно подчистить какие-либо ресурсы или что-то логгировать. Однако этот обработчик используется редко и вызывается он если только пометить процесс генсервера как системный, то есть через `Process.flag(:trap_exit, true)`. В целом, если нет какой-либо острой нужды в сохранении состояния или освобождения ресурсов после завершения процесса, то использовать этот обработчик нет необходимости.

Мы рассмотрели необходимый минимум, чтобы понимать, что такое процессы в Elixir экосистеме, что такое OTP и как все это использовать. Познакомились с абстракциями `Supervisor`, `GenServer`, `Agent` и узнали о дереве супервизии. Для еще лучшего понимания, какие идеи стоят за процессами, стоит почитать про акторную модель и историю языка Erlang.
