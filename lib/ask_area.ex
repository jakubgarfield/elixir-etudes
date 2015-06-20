defmodule Etudes.AskArea do
  alias Etudes.Geom

  @moduledoc """
  A user interface for calculating the area
  """


  @doc """
  Asks for user input and returns the area
  """
  @spec area() :: number
  def area do
    input = IO.gets("R)ectangle, T)riangle, E)llipse")
    shape = char_to_shape(String.first(input))
    {a, b} = get_dimensions("a", "b")
    calculate(shape, a, b)
  end


  @spec char_to_shape(char) :: atom
  defp char_to_shape(c) do
    cond do
      String.upcase(c) == "R" -> :rectangle
      String.upcase(c) == "T" -> :triangle
      String.upcase(c) == "E" -> :ellipse
      true -> :unknown
    end
  end


  @spec get_number(String.t) :: number
  defp get_number(prompt) do
    input = IO.gets("Enter #{ prompt} >")
    try do
      String.to_integer(String.strip(input))
    rescue
      ArgumentError -> get_number(prompt)
    end
  end


  @spec get_dimensions(String.t, String.t) :: number
  defp get_dimensions(prompt1, prompt2) do
    { get_number(prompt1), get_number(prompt2) }
  end


  @spec calculate(atom, number, number) :: number
  defp calculate(:unknown, _, _) do
    IO.puts("Unknown shape")
    0
  end

  defp calculate(_, a, b) when a <= 0 or b <= 0 do
    IO.puts("Both numbers must be > 0")
    0
  end

  defp calculate(shape, a, b) do
    Geom.area({shape, a, b})
  end
end
