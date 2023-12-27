
Супервизоры - процессы которые следят за жизненным циклом других процессов (потомков). Благодаря супервизорам появляется возможность выстраивать внутри приложения специальную иерархическую структуру, называемую *деревом супервизии*. Дерево супервизии позволяет выстраивать отказоустойчивы приложения, логика обработки и перезапуска процессов в котором скрыта от пользователя приложения.

Супервизоры, как и дерево супервизии, являются частью OTP Erlang (Open Telecom Platform) - набором библиотек и подходов для упрощения работы с процессами. Далее по модулю мы познакомимся еще с одной важной сущностью OTP, помимо дерева супервизии и супервизоров.

Для запуска супервизора нужно передать ему список потомков с их спецификацией через функцию `start_link`. Либо реализовать модуль с функциями обратного вызова, соответствующих поведению `Supervisor`. Теперь создадим агента-счетчик, который передадим под наблюдение:

```elixir
defmodule Counter do
  use Agent

  def start_link(initial_state \\ 0) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def current_value do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def inc do
    Agent.update(__MODULE__, fn state -> state + 1 end)
  end

  def dec do
    Agent.update(__MODULE__, fn state -> state - 1 end)
  end

  def boom do
    raise "boom"
  end
end
```

При использовании поведения `Agent`, в модуль добавилась функция `child_spec/1`. Она и нужна для запуска агента через супервизора. У сгенерированной функции арность 1, для того, чтобы передать начальное состояние при инициализации агента. Вызовем эту функцию:

```elixir
Counter.child_spec(0)
# => %{id: Counter, start: {Counter, :start_link, [0]}}

Counter.child_spec(5)
# => %{id: Counter, start: {Counter, :start_link, [5]}}
```

Как видно из примеров, `child_spec/1` всего лишь возвращает словарь с конфигурацией процесса, идентификатором процесса выступает его модуль, под ключом `:start` находится информация о том, как запускать процесс. Перевести эту спецификацию можно следующим образом: в первом вызове `child_spec/1` процесс нужно запустить `Counter.start_link(0)`, во втором случае `Counter.start_link(5)`.

Идея в том, что при запуске супервизору нужно передать список наблюдаемых процессов, в которых содержится кортеж с названием модулей и его начальным состоянием. А теперь запустим супервизора для наблюдения за агентом:

```elixir
children = [
  {Counter, 0}
]

{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_all)
pid
# => #PID<0.127.0>
```

Создался процесс-супервизор, который запустил агента и отслеживает его состояние. Можно и не указывать начальное состояние, передав список потомков без кортежей:

```elixir
children = [Counter]

{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_all)
# => #PID<0.129.0>
```

Однако в таком случае, в `start_link/1` агента передастся пустой список:

```elixir
defmodule Counter do
  use Agent

  def start_link(initial_state \\ 0) do
    IO.inspect(initial_state)
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end
end

children = [Counter]

{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_all)
# => []
# => #PID<0.131.0>
```

В таких случаях нужно переписать инициализацию процесса таким образом:

```elixir
def start_link(opts) do
  {initial_value, opts} = Keyword.pop(opts, :initial_value, 0)
  Agent.start_link(fn -> initial_value end, opts)
end
```

Теперь, когда процесс запущен, можно получить служебную информацию о супервизоре с помощью `count_children` и `which_children`, а так же пользоваться агентом по прямому назначению:

```elixir
{:ok, pid} = Supervisor.start_link([{Counter, 0}], strategy: :one_for_all)

Supervisor.count_children(pid)
# => %{active: 1, workers: 1, supervisors: 0, specs: 1}

Counter.inc()
Counter.inc()
Counter.current_value()
# => 2

Supervisor.which_children(pid)
# => [{Counter, #PID<0.146.0>, :worker, [Counter]}]
```

Рассмотрим запуск супервизора `Supervisor.start_link(children, strategy: :one_for_all)`, а конкретно `strategy: :one_for_all`. Эта опция является стратегией перезапуска процессов которые завершились аварийно. Таких стратегий перезапуска несколько:
- `:one_for_one` - если потомок-процесс аварийно завершился, то только этот процесс и будет перезапущен;
- `:one_for_all` - если один из потомков аварийно завершился, то *все* дочерние процессы супервизора завершатся и перезапустятся;
- `:rest_for_one` - если один из потомков аварийно завершился, то только этот процесс и все следующие за ним потомки завершатся и перезапустятся.

Зачастую используются стратегии `:one_for_one` и `:rest_for_one`.

Помимо стратегии перезапуска, в супервизоре можно указать, каким образом завершать наблюдаемые процессы. А точнее, какой сигнал выхода отправить процессу при, например, перезапуске. Можно указать приоритет у процессов потомков, например, если есть какой-то важный процесс потомок, без которого супервизия не имеет смысла и после завершения работы этого потомка супервизор получает сигнал от этого процесса и супервизор завершает работу (process shutdown). Об этом можно подробнее почитать в [официальной документации](https://hexdocs.pm/elixir/Supervisor.html#module-supervisor-strategies-and-options). Тепрерь посмотрим на примере, как работает стратегия `:one_for_all`:

```elixir
{:ok, supervisor_pid} = Supervisor.start_link([{Counter, 0}], strategy: :one_for_one)

Counter.inc()
Counter.current_value()
# => 1

# теперь вызовем функцию которая бросит исключение
Counter.boom()
# => ** (RuntimeError) boom
# =>   iex:71: Counter.boom/0
# =>   iex:67: (file)

Supervisor.count_children(supervisor_pid)
# => %{active: 1, workers: 1, supervisors: 0, specs: 1}

Counter.current_value()
# => 0
```

Процесс `Counter` завершился с ошибкой, супервизор перехватил исключение и перезапустил процесс счетчик с начальным состоянием по умолчанию.
