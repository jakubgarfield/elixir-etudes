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

  def generate_pockets(list_of_teeth, probability) do
    :random.seed(:erlang.now())
    generate_pockets(list_of_teeth, probability, [])
  end

  defp generate_pockets([head | tail], probability, accumulator) do
    if head == ?T do
      generate_pockets(tail, probability, accumulator ++ [generate_tooth(probability)])
    else
      generate_pockets(tail, probability, accumulator ++ [0])
    end
  end

  defp generate_pockets([], _, accumulator) do
    accumulator
  end

  defp generate_tooth(probability) do
    if (:random.uniform < probability) do
      generate_tooth(2, 6, [])
    else
      generate_tooth(3, 6, [])
    end
  end

  defp generate_tooth(_, 0, acc) do
    acc
  end

  defp generate_tooth(base, n, acc) do
    delta = :random.uniform(3) - 2
    generate_tooth(base, n - 1, acc ++ [base + delta])
  end

  def test_pockets() do
    tlist = 'FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT'
    big_list = generate_pockets(tlist, 0.75)
    print_pockets(big_list)
  end

  defp print_pockets([]), do: IO.puts("Finished.")

  defp print_pockets([head | tail]) do
    IO.puts(inspect(head))
    print_pockets(tail)
  end
end
