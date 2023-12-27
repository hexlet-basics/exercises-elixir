
Создайте функцию `shift_days`, которая принимает структуры `Time`, `DateTime`, `NaiveDateTime`, `Date` и смещает ее на количество переданных дней. Дни могут быть отрицательным числом:

```elixir
naive_time = NaiveDateTime.utc_now()
# => ~N[2023-11-17 18:24:21.345116]


Solution.shift_days(naive_time, -2)
# => ~N[2023-11-15 18:24:21.345116]
Solution.shift_days(naive_time, 1)
# => ~N[2023-11-18 18:24:21.345116]
Solution.shift_days(naive_time, 0)
# => ~N[2023-11-17 18:24:21.345116]

date = Date.utc_today()
# => ~D[2023-11-17]
Solution.shift_days(date, -2)
# => ~D[2023-11-15]
Solution.shift_days(date, 1)
# => ~D[2023-11-18]
Solution.shift_days(date, 0)
# => ~D[2023-11-17]
```
