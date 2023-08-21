defmodule Test do
  use ExUnit.Case

  describe "cache server work" do
    test "put" do
      parent = self()
      cache_server = spawn(fn -> CacheServer.init(parent) end)

      send(cache_server, {:put, {:hello, "world"}})
      assert_receive({:ok, "world"})
      assert Process.alive?(cache_server)

      send(cache_server, {:put, {:key, "value"}})
      assert_receive({:ok, "value"})
      assert Process.alive?(cache_server)
    end

    test "get" do
      parent = self()
      cache_server = spawn(fn -> CacheServer.init(parent) end)
      send(cache_server, {:put, {:hello, "world"}})

      send(cache_server, {:get, {:hello}})
      assert_receive({:ok, "world"})
      assert Process.alive?(cache_server)

      send(cache_server, {:get, {:some}})
      assert_receive({:error, :not_found})
      assert Process.alive?(cache_server)
    end

    test "drop" do
      parent = self()
      cache_server = spawn(fn -> CacheServer.init(parent) end)
      send(cache_server, {:put, {:hello, "world"}})

      send(cache_server, {:drop, {:hello}})
      assert_receive({:ok, :hello})
      assert Process.alive?(cache_server)

      send(cache_server, {:drop, {:some}})
      assert_receive({:ok, :some})
      assert Process.alive?(cache_server)
    end

    test "exit" do
      parent = self()
      cache_server = spawn(fn -> CacheServer.init(parent) end)

      send(cache_server, {:exit})
      assert_receive({:ok, :exited})
      refute Process.alive?(cache_server)
    end

    test "unexpected input" do
      parent = self()
      cache_server = spawn(fn -> CacheServer.init(parent) end)

      send(cache_server, {:something, {1, 2, 3}})
      assert_receive({:error, :unrecognized_operation})
      assert Process.alive?(cache_server)

      send(cache_server, :boom)
      assert_receive({:error, :unrecognized_operation})
      assert Process.alive?(cache_server)
    end
  end
end
