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

  test "triangle area" do
    assert Etudes.Geom.area(:triangle, 3, 5) == 7.5
  end

  test "rectangle area" do
    assert Etudes.Geom.area(:rectangle, 3,4) == 12
  end

  test "ellipse area" do
    assert Etudes.Geom.area(:ellipse, 2,4) == 25.132741228718345
  end

  test "negative length for triangle" do
    assert Etudes.Geom.area(:triangle, -3, 2) == 0
  end

  test "negative b for ellipse" do
    assert Etudes.Geom.area(:ellipse, 1, -2) == 0
  end

  test "negative sides for rectangle" do
    assert Etudes.Geom.area(:rectangle, -1, -1) == 0
  end

  test "return 0 for not supported type" do
    assert Etudes.Geom.area(:pentagon, 2, 5) == 0
  end
end
