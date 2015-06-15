defmodule Etudes.Geom do
  @moduledoc """
  Provides geometrical functions
  """

  @doc """
  Calculates the area of the rectangular shape
  """
  @spec area(number(), number()) :: number()
  def area(height \\ 1, width \\ 1) do
    height * width
  end

  @doc """
  Calculates the area of a selected shape
  """
  @spec area(atom, number, number) :: number
  def area(:rectangle, height, width) when height >= 0 and width >= 0 do
    area(height, width)
  end

  def area(:triangle, a, b) when a >= 0 and b > 0 do
    (a * b) / 2
  end

  def area(:ellipse, a, b) when a >= 0 and b >= 0 do
    :math.pi * a * b
  end

  def area(_, _, _) do
    0
  end
end
