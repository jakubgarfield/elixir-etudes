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



  test "#nth_root square of 36" do
    assert Powers.nth_root(36, 2) == 6
  end

  test "#nth_root first root of number is a number" do
    assert Powers.nth_root(100, 1) == 100
  end

  test "#nth_root cube root of 27" do
    assert Powers.nth_root(27, 3) == 3
  end
end
