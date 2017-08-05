defmodule Pop.Stack do
	use GenServer

	####
	# External API
	def start_link(stash_pid) do
		GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
	end

	def pop do
		GenServer.call __MODULE__, :pop
	end

	def push(item)do
		GenServer.cast __MODULE__, {:push, item}
	end

	def kill do
		GenServer.stop __MODULE__
	end
	
	####
	# GenServer piping
	def init(stash_pid) do
		stack = Pop.Stash.get_value stash_pid
		{ :ok, {stack, stash_pid}}
	end
	def handle_call(:pop, _from, {[head|tail], stash_pid}) 	do
		{ :reply, head, {tail, stash_pid} }
	end

	def handle_cast({:push, item}, {list, stash_pid}) 	do
		{ :noreply, {[item|list], stash_pid} }
	end

	def terminate(_reason, {list, stash_pid}) do
		Pop.Stash.save_value stash_pid, list
	end

end