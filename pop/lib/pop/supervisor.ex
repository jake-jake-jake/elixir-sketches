defmodule Pop.Supervisor do
	use Supervisor
	def start_link(initial_stack) do
		result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_stack])
		start_workers(sup, initial_stack)
		result
	end
	
	def start_workers(sup, initial_stack) do 
		# Start the stack worker to store state
		{:ok, stash} = Supervisor.start_child(sup, worker(Pop.Stash, [initial_stack]))
		# Then the subsupervisor to monitor the actual Pop server
		Supervisor.start_child(sup, supervisor(Pop.SubSupervisor, [stash]))
	end
	
	def init(_) do
		supervise [], strategy: :one_for_one
	end
end