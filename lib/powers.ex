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


  @doc """
  Raises the number but this time it doesn't blow the stack
  """
  @spec pow_tail(number, number) :: number
  def pow_tail(_, 0) do
    1
  end

  def pow_tail(x, 1) do
    x
  end

  def pow_tail(x, e) when e > 1 do
    pow_tail(x, e, 1)
  end

  def pow_tail(x, e) when e < 0 do
    1.0 / pow_tail(x, -e)
  end

  @spec pow_tail(number, number, number) :: number
  defp pow_tail(_, 0, acc) do
    acc
  end

  defp pow_tail(x, e, acc) do
    pow_tail(x, e - 1, x * acc)
  end


  @doc """
  Calculates the nth_root with Newton-Raphson method
  """
  @spec nth_root(number, number) :: number
  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  @spec nth_root(number, number, number) :: number
  defp nth_root(x, n, guess) do
    f = pow_tail(guess, n) - x
    f_prime = n * pow_tail(guess, n - 1)

    next = guess - f / f_prime
    change = abs(guess - next)

    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end
end
