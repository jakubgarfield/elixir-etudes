defmodule Etudes.Dijkstra do
  @moduledoc """
  A module with all the great mathematic algorithms from Dijkstra
  """

  @doc """
  Calculates the greatest common divisor of two numbers using Dijkstra
  method
  """
  @spec gcd(number, number) :: number
  def gcd(x, y) when x == y do
    x
  end

  def gcd(x, y) when x > y do
    gcd(x - y, y)
  end

  def gcd(x, y) do
    gcd(x, y - x)
  end
end
