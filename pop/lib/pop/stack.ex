defmodule Pop.Stack do
	use GenServer

	def start_link(stack) do
		GenServer.start_link(__MODULE__, stack, name: __MODULE__)
	end

	def pop do
		GenServer.call __MODULE__, :pop
	end

	def push(item)do
		GenServer.cast __MODULE__, {:push, item}
	end

	def handle_call(:pop, _from, [head|tail]) 	do
		{ :reply, head, tail }
	end

	def handle_cast({:push, item}, list) 	do
		{ :noreply, [item|list] }
	end

	def terminate({:emptystack, []}) do
		{:emptystack, []}
	end
end