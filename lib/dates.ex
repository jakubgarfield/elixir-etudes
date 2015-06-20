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
end
