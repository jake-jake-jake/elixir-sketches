defmodule MyList do
	def span(from, to) when is_integer(from) and is_integer(to) do
		from..to |> Enum.to_list
	end

	def flatten(l) when is_list(l), do: _flatten(l)

	def _flatten(l, acc \\ [])
	def _flatten([], acc), do: acc ++ []
	def _flatten([h|t], acc) when is_list(h), do: _flatten(t, acc ++ _flatten(h))
	def _flatten([h|t], acc), do: _flatten(t, acc ++ [h])

end