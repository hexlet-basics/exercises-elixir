
Создайте функцию `fetch_gamers`, которая принимает список сотрудников и выводит список активных сотрудников (статус `:active`) сотрудников у которых хобби связаны с играми (тип хобби `:gaming`). Структура сотрудников описана в примере:

```elixir
employees = [
  %{
    name: "Eric",
    status: :active,
    hobbies: [%{name: "Text Adventures", type: :gaming}, %{name: "Chickens", type: :animals}]
  },
  %{
    name: "Mitch",
    status: :former,
    hobbies: [%{name: "Woodworking", type: :making}, %{name: "Homebrewing", type: :making}]
  },
  %{
    name: "Greg",
    status: :active,
    hobbies: [
      %{name: "Dungeons & Dragons", type: :gaming},
      %{name: "Woodworking", type: :making}
    ]
  }
]


Solution.fetch_gamers(employees)
# => [
# =>   {"Eric", %{name: "Text Adventures", type: :gaming}},
# =>   {"Greg", %{name: "Dungeons & Dragons", type: :gaming}}
# => ]
```
