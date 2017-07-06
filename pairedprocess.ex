defmodule PairedProcess do
	def greet do
		receive do
			{:ok, msg}
			IO.puts "Received: #{msg}"
			greet
		end
	end

	
end