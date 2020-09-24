defmodule SensorServerTest do
  use ExUnit.Case
  doctest SensorServer

  test "greets the world" do
    assert SensorServer.hello() == :world
  end
end
