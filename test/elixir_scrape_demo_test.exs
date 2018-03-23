defmodule ElixirScrapeDemoTest do
  use ExUnit.Case
  doctest ElixirScrapeDemo

  test "greets the world" do
    assert ElixirScrapeDemo.hello() == :world
  end
end
