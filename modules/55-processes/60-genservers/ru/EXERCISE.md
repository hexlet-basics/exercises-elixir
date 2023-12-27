
В файле с решением описана инициализация генсервера-кеша, ваша задача дописать модуль `Solution`, добавив следующие функции:
- `add/2` - функция добавляющая в кеш ключ-значение, асинхронная;
- `drop/1` - функция, удаляющая из кеша значение по переданному ключу, асинхронная;
- `reset/0` - функция, сбрасывающая состояние генсервера, асинхронная;
- `current_state/0` - функция, возвращающая состояние генсервера, синхронная;
- `has?/1` - функция, проверяющая, есть ли переданный ключ в состоянии генсервера, синхронная.

Если не понятно, использовать `handle_cast` или `handle_call`, то изучите семантику реализуемых функций, нужен ли ответ от генсервера или нет.

```elixir
Solution.start_link()
# => {:ok, #PID<0.121.0>}

Solution.current_state()
# => %{}

Solution.add(:my_key, "value")
# => :ok

Solution.current_state()
# => %{my_key: "value"}

Solution.has?(:my_key)
# => true

Solution.has?(:other_key)
# => false

Solution.drop(:not_existing_key)
# => :ok

Solution.current_state()
# => %{my_key: "value"}

Solution.drop(:my_key)
# => :ok

Solution.current_state()
# => %{}

1..10 |> Enum.each(&(Solution.add("key_#{&1}", "value_#{&1}")))

Solution.current_state()
# => %{
# =>   "key_1" => "value_1",
# =>   "key_10" => "value_10",
# =>   "key_2" => "value_2",
# =>   "key_3" => "value_3",
# =>   "key_4" => "value_4",
# =>   "key_5" => "value_5",
# =>   "key_6" => "value_6",
# =>   "key_7" => "value_7",
# =>   "key_8" => "value_8",
# =>   "key_9" => "value_9"
# => }

Solution.reset()
# => :ok
Solution.current_state()
# => %{}
```
