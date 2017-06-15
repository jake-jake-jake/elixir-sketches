defmodule ImplementEnum do
	def all?([]), do: true
	def all?([h|t]) do
		if h do
			all? t
		else
			false
		end
	end

	def all?([], _func), do: true
	def all?([h|t], func) do
		if func.(h) do
			all?(t, func)
		else
			false
		end
	end

	def each([], _), do: nil
	def each([h|t], func) do
		func.(h)
		each(t, func)
	end

	def filter(list, func, acc \\ [])
	def filter([], _, acc), do: acc
	def filter([h|t], func, acc) do
		if func.(h) do
			filter(t, func, acc ++ [h])
		else
			filter(t, func, acc)
		end
	end

	def split(list, count, new \\ [])
	def split([], _, new) do
		{new, []}
	end
	def split(list, count, new) when count == 0 do
		{new, list}
	end
	def split([h|t], count, new) do
		split(t, count - 1, new ++ [h])
	end 

	def take(list, count, new \\ [])
	def take([], _, new), do: new
	def take(_, count, new) when count == 0, do: new
	def take([h|t], count, new), do: take(t, count - 1, new ++ [h])
end