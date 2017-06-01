defmodule Chop do
	def guess(actual, range) do
		a..b = range
		attempt = _diff(a, b) + a
		_guess(actual, a, b, attempt)
	end

	defp _guess(actual, a, b, attempt)

	defp _guess(actual, _a, _b, attempt) when attempt==actual do
		IO.puts actual
	end

	defp _guess(actual, _a, b, attempt) when actual>attempt do
		IO.puts "Is your number #{attempt}?"
		range = attempt..b
		guess(actual, range)
	end

	defp _guess(actual, a, _b, attempt) when actual<attempt do
		IO.puts "Is your number #{attempt}?"
		range = a..attempt
		guess(actual, range)
	end

	defp _diff(a, b) do
		div(b-a, 2)
	end
end