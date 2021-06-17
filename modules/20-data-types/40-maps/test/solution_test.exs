defmodule Test do
  use ExUnit.Case
  import Solution

  test "keys_sum" do
    map = %{a: 1, b: 2, c: 42}
    assert keys_sum(map, :a, :b) == 3
    assert keys_sum(map, :a, :c) == 43
    assert keys_sum(map, :c, :b) == 44
    assert keys_sum(map, :a, :a) == 2
    assert keys_sum(map, :a, :d) == 1
    assert keys_sum(map, :d, :c) == 42
    assert keys_sum(map, :d, :e) == 0
  end

  test "keys_product" do
    map = %{one: 1, five: 5, ten: 10}
    assert keys_product(map, :one, :five) == 5
    assert keys_product(map, :one, :ten) == 10
    assert keys_product(map, :five, :ten) == 50
    assert keys_product(map, :five, :five) == 25
    assert keys_product(map, :five, :two) == 5
    assert keys_product(map, :two, :ten) == 10
    assert keys_product(map, :two, :three) == 1
  end

  test "copy_key" do
    map1 = %{a: 1, b: 2}
    map2 = %{c: 3, d: 4}
    assert copy_key(map1, map2, :a, 42) == %{c: 3, d: 4, a: 1}
    assert copy_key(map1, map2, :b, 42) == %{c: 3, d: 4, b: 2}
    assert copy_key(map1, map2, :e, 42) == %{c: 3, d: 4, e: 42}
    assert copy_key(map1, map2, :c, 42) == %{c: 42, d: 4}
    
    assert copy_key(map2, map1, :c, 42) == %{a: 1, b: 2, c: 3}
    assert copy_key(map2, map1, :d, 42) == %{a: 1, b: 2, d: 4}
    assert copy_key(map2, map1, :e, 42) == %{a: 1, b: 2, e: 42}
    assert copy_key(map2, map1, :b, 42) == %{a: 1, b: 42}
  end
  
end
