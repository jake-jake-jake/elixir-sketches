defmodule LinkedSpawn do
	def take do
		receive do
			{:ok, num, sender} ->
				IO.puts "RECEIVED #{num} from #{inspect sender}"
				send(sender, {:ok, num})
				take()
			{:die, _, sender} ->
				:timer.sleep(500)
				send(sender, {:die, self()})
				exit :boom
		end
	end

	def give do
			receive do
				{word, num, target} ->
					IO.puts "#{inspect self()} SENDING MESSAGE TO #{inspect target}"
					send(target, {word, num, self()})
					give()
				{:ok, num} ->
					IO.puts "RECEIVED: #{inspect num}"
					give()
				{:die, pid} ->
					IO.puts "PID DIED: #{inspect pid}"
					give()
				_ ->
					IO.puts "MALFORMED MESSAGE"
					give()
			end
	end

	def receive_all do
		receive do
			msg ->
				IO.puts "RECEIVED: #{inspect msg}"
				receive_all()				
			after 500 ->
				IO.puts "NO MORE MESSAGES."
		end
	end
end

taker = spawn_link(LinkedSpawn, :take, [])
giver = spawn_link(LinkedSpawn, :give, [])

send(giver, {:ok, 1000, taker})
send(giver, {:ok, 1010, taker})
send(giver, {:ok, 1020, taker})
send(giver, {:die, 1000, taker})
