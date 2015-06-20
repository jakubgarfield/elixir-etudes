defmodule Etudes.Stats do
  @moduledoc """
  Lots of stats functions on list
  """

  @spec minimum(list) :: number
  def minimum([head | tail]) do
    minimum(tail, head)
  end

  defp minimum([head | tail], minimum) when minimum < head  do
    minimum(tail, minimum)
  end

  defp minimum([head | tail], _) do
    minimum(tail, head)
  end

  defp minimum([], minimum) do
    minimum
  end


  @spec maximum(list) :: number
  def maximum([head | tail]) do
    maximum(tail, head)
  end

  defp maximum([head | tail], maximum) when maximum > head  do
    maximum(tail, maximum)
  end

  defp maximum([head | tail], _) do
    maximum(tail, head)
  end

  defp maximum([], maximum) do
    maximum
  end


  @spec range(list) :: list
  def range(list) do
    [minimum(list), maximum(list)]
  end
end
