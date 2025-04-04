
Реализовать функцию `point_inside_circle?(point, circle)`, которая принимает точку и окружность, и возвращает `true`, если точка находится внутри окружности, или `false`, если точка находится снаружи.

Реализовать функцию `point_inside_rect?(point, rect)`, которая принимает точку и прямоугольник, и возвращает `true`, если точка находится внутри прямоугольника, или `false`, если точка находится снаружи.

Точка представлена кортежем `{:point, x, y}`.

Окружность представлена кортежем `{:circle, center, radius}`, где center — это кортеж `:point`.

Прямоугольник представлен кортежем `{:rect, left_top, right_bottom}`, где `left_top` и `right_bottom` — это кортежи `:point`.

Уже реализованная функция distance может вам пригодиться:

```elixir
point = {:point, 50, 50}
Solution.point_inside_circle?(point, {:circle, {:point, 10, 10}, 100})
# => true
Solution.point_inside_circle?(point, {:circle, {:point, -10, -10}, 20})
# => false

point = {:point, -10, 20}
Solution.point_inside_rect?(point, {:rect, {:point, -20, 30}, {:point, 20, 10}})
# => true
Solution.point_inside_rect?(point, {:rect, {:point, 0, 0}, {:point, 10, 10}})
# => false
```
