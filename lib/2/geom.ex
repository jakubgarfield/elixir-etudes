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
end
