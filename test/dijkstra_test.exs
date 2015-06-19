defmodule Etudes.DijkstraTest do
  use ExUnit.Case
  alias Etudes.Dijkstra

  test "gcd of the same number should equal that number" do
    assert Dijkstra.gcd(8, 8) == 8
  end

  test "no common divisor apart from 1" do
    assert Dijkstra.gcd(125, 146) == 1
  end

  test "one of the numbers is greater and they share a common divisor greater than 1" do
    assert Dijkstra.gcd(120, 36) == 12
  end
end
