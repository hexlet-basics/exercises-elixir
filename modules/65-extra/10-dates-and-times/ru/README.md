
В Эликсире есть несколько модулей для работы с датами и временем, рассмотрим их.

Первым в списке модуль `Time`, исходя из его названия, модуль предоставляет структуру данных и функции для работы со временем:

```elixir
current_time = Time.utc_now()
# => ~T[13:40:18.506292]

current_time.hour # => 13
current_time.minute # => 40
current_time.second # => 18
current_time.calendar # => Calendar.ISO

current_time.day
# => ** (KeyError) key :day not found in: ~T[13:40:18.506292]

Time.add(current_time, 20, :minute)
# => ~T[14:00:18.506292]
Time.add(current_time, 2, :hour)
# => ~T[15:40:18.506292]
```

Второй модуль `Date`, он работает только с датами, без информации о времени:

```elixir
current_date = Date.utc_today()
# => ~D[2023-11-18]

current_date.day # => 18
current_date.month # => 11
current_date.year # => 2023

Date.add(current_date, 5)
# => ~D[2023-11-23]
Date.add(current_date, -2)
# => ~D[2023-11-16]

Date.beginning_of_week(current_date)
# => ~D[2023-11-13]
Date.end_of_week(current_date)
# => ~D[2023-11-19]

Date.leap_year?(current_date)
# => false
```

Третий модуль называется `NaiveDateTime`, он уже поддерживает и дату и время, однако, этот модуль не поддерживает часовые пояса:

```elixir
current = NaiveDateTime.utc_now()
# => ~N[2023-11-18 15:08:23.108947]

NaiveDateTime.add(current, 5, :second)
# => ~N[2023-11-18 15:08:28.108947]
NaiveDateTime.add(current, -30, :millisecond)
# => ~N[2023-11-18 15:08:23.078947]
NaiveDateTime.add(current, 5, :day)
# => ~N[2023-11-23 15:08:23.108947]

NaiveDateTime.end_of_day(current)
# => ~N[2023-11-18 23:59:59.999999]
NaiveDateTime.beginning_of_day(current)
# => ~N[2023-11-18 00:00:00.000000]
```

Четвертый модуль `DateTime` не имеет такого недостатка, как `NaiveDateTime`, то есть `DateTime` поддерживает часовые пояса, но за этим нужно следить. Многие функции из этого модуля требуют базу данных часовых поясов. По умолчанию они используют базу данных, которую возвращает функция `Calendar.get_time_zone_database`, а эта база поддерживает только пояс `“Etc/UTC”`. Если нужно менять часовые пояса, советую присмотреться к библиотеке [tzdata](https://github.com/lau/tzdata). Теперь изучим `DateTime`:

```elixir
current = DateTime.utc_now()
# => ~U[2023-11-18 15:16:12.046038Z]
future = DateTime.add(current, 2, :day)
# => ~U[2023-11-20 15:16:12.046038Z]

DateTime.compare(current, future) # => :lt
DateTime.diff(current, future) # => -172800

DateTime.from_naive!(NaiveDateTime.utc_now(), "Etc/UTC")
# => ~U[2023-11-18 15:18:54.394424Z]

DateTime.to_date(current)
# => ~D[2023-11-18]
```

Как было видно из примеров, время и даты можно задавать через строковые метки (сигили), для `Time` - `~T`, для `Date` - `~D`, для `NaiveDateTime` - `~N`, для `DateTime` - `~U` соответственно:

```elixir
~T[13:40:18.506292]
# => ~T[13:40:18.506292]

~D[2023-11-18]
# => ~D[2023-11-18]
```
