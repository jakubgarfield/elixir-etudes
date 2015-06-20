defmodule Etudes.DatesTest do
  use ExUnit.Case
  alias Etudes.Dates

  test "#date_parts parses date parts" do
    assert Dates.date_parts("2014-03-12") === [2014, 3, 12]
  end
end
