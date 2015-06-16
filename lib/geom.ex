defmodule Etudes.Geom do
  @moduledoc """
  Provides geometrical functions
  """

  @doc """
  Calculates the area of a selected shape
  """
  @spec area({atom, number, number}) :: number
  def area({shape, a, b}) do
    area(shape, a, b)
  end

  defp area(:rectangle, height, width) when height >= 0 and width >= 0 do
    height * width
  end

  defp area(:triangle, a, b) when a >= 0 and b > 0 do
    (a * b) / 2
  end

  defp area(:ellipse, a, b) when a >= 0 and b >= 0 do
    :math.pi * a * b
  end

  defp area(_, _, _) do
    0
  end
end
