defmodule MyList do
	def span(from, to) when is_integer(from) and is_integer(to) do
		from..to |> Enum.to_list
	end 
end