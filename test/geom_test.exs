defmodule Etudes.GeomTest do
  use ExUnit.Case
  alias Etudes.Geom
  test "triangle area" do
    assert Geom.area({:triangle, 3, 5}) == 7.5
  end

  test "rectangle area" do
    assert Geom.area({:rectangle, 3, 4}) == 12
  end

  test "ellipse area" do
    assert Geom.area({:ellipse, 2, 4}) == 25.132741228718345
  end

  test "negative length for triangle" do
    assert Geom.area({:triangle, -3, 2}) == 0
  end

  test "negative b for ellipse" do
    assert Geom.area({:ellipse, 1, -2}) == 0
  end

  test "negative sides for rectangle" do
    assert Geom.area({:rectangle, -1, -1}) == 0
  end

  test "return 0 for not supported type" do
    assert Geom.area({:pentagon, 2, 5}) == 0
  end
end
