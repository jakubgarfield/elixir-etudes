defmodule Etudes.GeomTest do
  use ExUnit.Case

  test "rectangle area" do
    assert Etudes.Geom.area(3, 4) == 12
  end

  test "bigger rectangle area" do
    assert Etudes.Geom.area(12, 7) == 84
  end

  test "defaults to rectangle of width 1" do
    assert Etudes.Geom.area(7) == 7
  end

  test "defaults to square of 1x1" do
    assert Etudes.Geom.area() == 1
  end
end
