defmodule Parallel do
	def pmap(collection, fun) do
		me = self()
		collection
		|> Enum.map( fn (elem) ->
				spawn_link fn -> (send me, { self(), fun.(elem) }) end
			 end)
		|> Enum.map( fn (pid) ->
				 receive do { _pid, result} -> result end
			 end)
	end
end

defmodule Funcs do
	def mult_wait(num) do
		:timer.sleep(:rand.uniform(200))
		num * num
	end
end
random_number = fn num -> :rand.uniform(num) end

Parallel.pmap(1..100, &(Funcs.mult_wait(&1)))