defmodule JSON do
	def parse_array binary do
		_parse(String.next_grapheme(binary))
	end
	
	defp _parse({next, rest}, obj_or_array \\ nil) do
		nil
	end

	defp _pair do
		?{ -> ?}
		?[ -> ?]
		?' -> ?'
		?" -> ?"
		_  -> nil
	end
end