defmodule Etudes.Teeth do
  @moduledoc """
  All for the dentists
  """

  @doc """
  Takes the teeth measurements and returns the ones with the problem
  """
  @spec alert(list(list)) :: list
  def alert(teeth) do
    alert(teeth, [], 1)
  end

  defp alert([tooth | tail], result, tooth_number) do
    cond do
      Etudes.Stats.maximum(tooth) >= 4 ->
        alert(tail, result ++ [tooth_number], tooth_number + 1)
      true ->
        alert(tail, result, tooth_number + 1)
    end
  end

  defp alert([], result, _) do
    result
  end
end
