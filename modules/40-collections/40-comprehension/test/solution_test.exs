defmodule Test do
  use ExUnit.Case

  test "fetch_gamers work" do
    assert Solution.fetch_gamers([]) == []

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

    assert Solution.fetch_gamers(employees) == [
             {"Eric", %{name: "Text Adventures", type: :gaming}},
             {"Greg", %{name: "Dungeons & Dragons", type: :gaming}}
           ]

    employees = [
      %{
        name: "Eric",
        status: :former,
        hobbies: [%{name: "Text Adventures", type: :gaming}, %{name: "Chickens", type: :animals}]
      },
      %{
        name: "Alice",
        status: :active,
        hobbies: [
          %{name: "World of Warcraft", type: :gaming}
        ]
      }
    ]

    assert Solution.fetch_gamers(employees) == [
             {"Alice", %{name: "World of Warcraft", type: :gaming}}
           ]

    employees = [
      %{
        name: "Mitch",
        status: :former,
        hobbies: [%{name: "Woodworking", type: :making}, %{name: "Homebrewing", type: :making}]
      }
    ]

    assert Solution.fetch_gamers(employees) == []
  end
end
