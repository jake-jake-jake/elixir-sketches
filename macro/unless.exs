defmodule My do
	defmacro unless(condition, clauses) do
		unless_clause = Keyword.get(clauses, :else, nil)
		else_clause = Keyword.get(clauses, :do, nil)
		quote do
			case unquote(condition) do
				val when val == true -> unquote(else_clause)
				_									   -> unquote(unless_clause)
			end
		end
	end
end 

defmodule Test do
	require My
		My.unless 1 + 1==2 do
			IO.puts "1 + 1== 2"
		else
			IO.puts "1 != 2"
	end
end