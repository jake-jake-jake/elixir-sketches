defmodule Listtools do
	def max([h|t]), do: _max(t, h)
	
	defp _max([], d), do: d
	defp _max([h|t], d) when h > d, do: _max(t, h)
	defp _max([h|t], d), do: _max(t, d)

	def caesar(n) do
		n |> Enum.map(&(_rot13(&1)))
	end

	defp _rot13(n) do
		if (n + 13 < 122) do
		  n + 13
		else
		  n - 13
		end
	end 
end