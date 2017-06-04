defmodule Listtools do
	def max([h|t]), do: _max(t, h)
	
	defp _max([], d), do: d
	defp _max([h|t], d) when h > d, do: _max(t, h)
	defp _max([h|t], d), do: _max(t, d)
end