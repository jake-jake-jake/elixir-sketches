defmodule ImplementEnum do
	def all?([]), do: true
	def all?([h|t]) do
		if h do
			all? t
		else
			false
		end
	end

	def all?([], func), do: true
	def all?([h|t], func) do
		if func.(h) do
			all?(t, func)
		else
			false
		end
	end
end