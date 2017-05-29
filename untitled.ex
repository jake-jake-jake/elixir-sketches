defmodule Chop do
	def guess(actual, a..b, attempt \\ nil)

	def guess(actual, a..b, _) when a==b do
		IO.puts actual
	end
end