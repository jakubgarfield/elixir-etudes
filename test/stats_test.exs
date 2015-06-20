defmodule Etudes.StatsTest do
  use ExUnit.Case
  alias Etudes.Stats

  test "#minimum from an array with one item" do
    assert Stats.minimum([4]) == 4
  end

  test "#minimum from an array with multiple items" do
    assert Stats.minimum([4, -2, 3, 2]) == -2
  end

  test "#maximum from an array with one item" do
    assert Stats.maximum([3]) == 3
  end

  test "#maximum from an array with multiple elements" do
    assert Stats.maximum([4, 4, 2, 6, 3]) == 6
  end

  test "#range for one element array is not that exciting" do
    assert Stats.range([4]) == [4, 4]
  end

  test "#range of a list with more elements" do
    assert Stats.range([1, 2, 3, 4, -2, 7, 1]) == [-2, 7]
  end
end
