defmodule Geom do
	@moduledoc """
	Module for Geometric operations 
	"""

	@doc """
	Return area for rectangle of given size; height and width default to 1. Example:
	iex> Geom.area(4, 4)
	16
	"""

	@spec area(number(), number()) :: number()
	def area(a \\ 1, b \\ 1) do
		a * b
	end
end