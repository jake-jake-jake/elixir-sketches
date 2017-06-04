defmodule Sum do
	def of(1), do: 1
	def of(n), do: n + of(n-1)

	def ofList([]), do: 0
	def ofList([h|t]), do: h + ofList t
end

defmodule Mapsum do
	def mapsum([], _func), do: 0
	def mapsum([h|t], func), do: func.(h) + mapsum(t, func)
end

