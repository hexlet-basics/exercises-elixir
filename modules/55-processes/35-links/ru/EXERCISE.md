
В файле с решением описан модуль `Worker`. Для работы с ним, нужно создать и связать процесс с этим модулем следующим образом:

```elixir
number = 5
spawn_link(fn -> Worker.work(number) end)
```

После этого, `Worker` проверяет число по правилам классической задачи с собеседований `FooBar` и процесс завершается с соответствующим сигналом:
- число кратно 3 и 5 - `:foobar`;
- число кратно 3 - `:foo`;
- число кратно 3 - `:bar`;
- в ином случае процесс завершается в штатном режиме `:normal`.

Создайте функцию `supervise_foobar` которая принимает число, вызывает `Worker` и на основе сигнала о завершении формирует строку, где вместо переданного числа подставляется `Foo`, `Bar`, `FooBar` либо ничего, затем число увеличивается на *единицу* и процесс проверки числа и сбора строки идет дальше.

Если переданное число больше 100 или меньше 1, то продолжать сбор строки не нужно. Не забудьте о `Process.flag(:trap_exit, true)`, так как иначе не получится собрать информацию о сигналах завершения `Worker`. Примеры:

```elixir
Solution.supervise_foobar(0)
# => ""

Solution.supervise_foobar(-10)
# => ""

Solution.supervise_foobar(11123)
# => ""

Solution.supervise_foobar(80)
# => "Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar"

Solution.supervise_foobar(100)
# => "Bar"

Solution.supervise_foobar(75)
# => "FooBar Foo Bar Foo Foo Bar Foo FooBar Foo Bar Foo Foo Bar"
```
