defmodule Etudes.PowersTest do
  use ExUnit.Case
  alias Etudes.Powers

  test "returns 1 when exponent is 0" do
    assert Powers.pow(10, 0) == 1
  end

  test "returns x when exponent is 1" do
    assert Powers.pow(10, 1) == 10
  end

  test "returns for positive exponent" do
    assert Powers.pow(2, 3) == 8
  end

  test "returns for negative exponent" do
    assert Powers.pow(2, -3) == 0.125
  end



  test "#pow_tail returns 1 when exponent is 0" do
    assert Powers.pow_tail(10, 0) == 1
  end

  test "#pow_tail returns x when exponent is 1" do
    assert Powers.pow_tail(10, 1) == 10
  end

  test "#pow_tail returns for positive exponent" do
    assert Powers.pow_tail(2, 3) == 8
  end

  test "#pow_tail returns for negative exponent" do
    assert Powers.pow_tail(2, -3) == 0.125
  end
end
