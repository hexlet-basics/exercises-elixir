
Супервизоры могут задаваться через модули, для этого нужно в модуле использовать поведение `Supervisor` и определить функцию обратного вызова `init/1`, которая будет вызвана при запуске супервизора через `start_link`. В файле с решением описано два агента, ваша задача дописать модуль `Solution`, добавив две функции:
- `start_link` - функция для запуска супервизора из модуля
- `init` - функция, которая запустится перед стартом супервизора, в неё передается список потомков, стратегия перезапуска и т.д.

В функции `init` сделайте потомками `Decrementor` и `Incrementor`, а в стратегии перезапуска укажите `:one_for_one`.

```elixir
{:ok, _} = Solution.start_link()

Supervisor.which_children(Solution)
# => [
# =>   {Decrementor, #PID<0.196.0>, :worker, [Decrementor]},
# =>   {Incrementor, #PID<0.195.0>, :worker, [Incrementor]}
# => ]

Supervisor.count_children(Solution)
# => %{active: 2, workers: 2, supervisors: 0, specs: 2}

Incrementor.run()
Incrementor.current_value()
# => 1

Decrementor.current_value()
# => 0
```
