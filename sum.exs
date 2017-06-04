defmodule Sum do
	def of(1), do: 1
	def of(n), do: n + of(n-1)

	def ofList([]), do: 0
	def ofList([h|t]), do: h + ofList t
end