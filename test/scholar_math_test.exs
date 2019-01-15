defmodule ScholarMathTest do
  use ExUnit.Case
  doctest ScholarMath

  test "greets the world" do
    assert ScholarMath.hello() == :world
  end
end
