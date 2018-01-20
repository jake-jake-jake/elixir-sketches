defmodule GeomTest do
	use ExUnit.Case 
  doctest Geom 

  test "area equals side times side" do
    assert(Geom.area(4, 4) == 16)
  end
end