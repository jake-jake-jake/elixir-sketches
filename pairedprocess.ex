defmodule PairedProcess do
	def greet do
		receive do
			{sender, msg} ->
				wait = Enum.random(300..700)
				Process.sleep(wait)
				send sender, {:ok, "Received: #{msg}"}
			greet()
		end
	end
end

fred = spawn(PairedProcess, :greet, [])
bettie = spawn(PairedProcess, :greet, [])


send fred, {self(), "Fred"}
send bettie, {self(), "Bettie"}

receive do
	{:ok, message} ->
		IO.puts message
	after 500 ->
		IO.puts "The greeter has gone away."
end

receive do
	{:ok, message} ->
		IO.puts message
	after 500 ->
		IO.puts "The greeter has gone away."
end

receive do
	{:ok, message} ->
		IO.puts message
	after 500 ->
		IO.puts "The greeter has gone away."
end
