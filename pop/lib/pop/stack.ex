defmodule Pop.Stack do
	use GenServer

	def handle_call(:pop, _from, [head|tail]) 	do
		{ :reply, head, tail }
	end
	def handle_cast({:push, item}, list) 	do
		{ :noreply, [item|list] }
	end
end