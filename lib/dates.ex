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
    monthly_total(day, month, days_in_year(year))
  end

  defp monthly_total(total, 1, _) do
    total
  end

  defp monthly_total(acc, i, [number_of_days_in_current_month | rest_of_the_year]) do
    monthly_total(acc + number_of_days_in_current_month, i - 1, rest_of_the_year)
  end

  defp days_in_year(year) do
    days_in_feb = cond do
      is_leap_year(year) -> 29
      true -> 28
    end
    [31, days_in_feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0) or (rem(year, 400) == 0)
  end
end
