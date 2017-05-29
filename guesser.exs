defmodule Chop do
	def guess(actual, range) do
		a..b = range
		attempt = _diff(a, b) + a
		_guess(actual, a, b, attempt)
	end

	def _guess(actual, a, b, attempt)

	def _guess(actual, a, b, attempt) when attempt==actual do
		IO.puts actual
	end

	def _guess(actual, a, b, attempt) when actual>attempt do
		IO.puts "Is your number #{attempt}?"
		range = attempt..b
		guess(actual, range)
	end

	def _guess(actual, a, b, attempt) when actual<attempt do
		IO.puts "Is your number #{attempt}?"
		range = a..attempt
		guess(actual, range)
	end

	def _diff(a, b) do
		div(b-a, 2)
	end
end