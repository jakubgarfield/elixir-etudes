defmodule Etudes.DatesTest do
  use ExUnit.Case
  alias Etudes.Dates

  test "#date_parts parses date parts" do
    assert Dates.date_parts("2014-03-12") == [2014, 3, 12]
  end


  test "#julian works for non leap years" do
    assert Dates.julian("2014-12-31") == 365
  end

  test "#julian works for leap year" do
    assert Dates.julian("2012-12-31") == 366
  end

  test "#julian works for all the test samples" do
    assert Dates.julian("2012-02-05") == 36
    assert Dates.julian("2013-02-05") == 36
    assert Dates.julian("1900-03-01") == 60
    assert Dates.julian("2000-03-01") == 61
    assert Dates.julian("2013-01-01") == 1
  end
end
