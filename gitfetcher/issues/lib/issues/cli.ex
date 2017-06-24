defmodule Issues.CLI do
	@default_count 4
	
	@moduledoc """
	Handle command line parsing and dispatch to functions 
	that generate a table of last _n_ issues in a github project.
	"""

	def run(argv) do
			argv
			|> parse_args
			|> process
	end

	@doc """
	`argv` can be -h or --help, which returns :help. 
	
	Otherwise it is a github project, username, and (optionally) the
	number of issues to fetch.

	Return a tuple of `{ user, project, count }` or `:help`.
	"""

	def parse_args(argv) do
		parse = OptionParser.parse(argv, switches: [help: :boolean],
																		 aliases: [h: :help])

		case parse do
			{[ help: true], _, _}
			  -> :help
			
			{_, [user, project, count], _}
				-> {user, project, String.to_integer(count)}
			
			{_, [user, project], _}
				-> {user, project, @default_count}
			
			_ -> :help
		end
	end

	def process(:help) do
		IO.puts """
		usage: issues <user> <project> [ count | #{@default_count}]
		"""
	end

	def process({user, project, _count}) do
		Issues.GithubIssues.fetch(user, project)
		|> decode_response
		|> convert_to_list_of_maps
	end

	def decode_response({:ok, body}), do: body
	def decode_response({:error, error}) do
		message = Map.get(error, "message", "NULL")
		IO.puts "Error fetching from Github: #{message}"
		System.halt(2)
	end

	def convert_to_list_of_maps(list) do
		list
		|> Enum.map(&Enum.into(&1, Map.new))
	end
end