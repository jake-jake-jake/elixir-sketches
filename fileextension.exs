defmodule File do
	def extension s do
		String.split(s, ".") |> List.last
	end
end