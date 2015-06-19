defmodule Etudes.Powers do
  @docmodule """
  Contains all the magical powering methods
  """

  @doc """
  Raises the number accordingly
  """
  @spec pow(number, number) :: number

  def pow(_, 0) do
    1
  end

  def pow(x, 1) do
    x
  end

  def pow(x, e) when e > 1 do
    x * pow(x, e - 1)
  end

  def pow(x, e) when e < 0 do
    1.0 / pow(x, -e)
  end
end
