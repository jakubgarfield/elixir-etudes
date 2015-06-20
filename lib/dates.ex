defmodule Etudes.Dates do
  @moduledoc  """
  Contains all the important functions for date manipulation
  """

  @doc """
  Takes the ISO date format yyyy-mm-dd and parses it into date parts
  """
  @spec date_parts(String.t) :: list
  def date_parts(iso_date) do
    string_parts = String.split(iso_date, "-")
    Enum.map(string_parts, fn(part) -> String.to_integer(part) end)
  end


  @spec julian(String.t) :: number
  def julian(iso_date) do
    [year, month, day] = date_parts(iso_date)
    julian(day, month, days_in_year(year))
  end

  defp julian(total, month, [number_of_days_in_current_month | rest_of_the_year]) when month > 1 do
    julian(total + number_of_days_in_current_month, month - 1, rest_of_the_year)
  end

  defp julian(total, _, _) do
    total
  end

  defp days_in_year(year) do
    cond do
      is_leap_year(year) -> [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      true -> [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0) or (rem(year, 400) == 0)
  end
end
