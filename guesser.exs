defmodule Chop do
	def guess(actual, a, b, attempt \\ nil)

	def guess(actual, a, b, attempt) when a==b do
		IO.puts actual
	end
	
	def guess(actual, a, b, attempt) when attempt==nil do
		guess(actual, a, b, makeguess(a, b))
	end

	def guess(actual, a, b, attempt) when actual>attempt do
		IO.puts "Is your number #{attempt}?"
		guess(actual, a, attempt)
	end

	def guess(actual, a, b, attempt) when actual<attempt do
		IO.puts "Is your number #{attempt}?"
		guess(actual, attempt, b)
	end

	def makeguess(a, b) do
		div(b-a, 2)
	end
end