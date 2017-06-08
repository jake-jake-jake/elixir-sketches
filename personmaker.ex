defmodule PersonMaker do
  @first_names ["Noah","Liam","William","Mason","James","Benjamin","Jacob","Michael","Elijah","Ethan",
                "Emma","Olivia","Ava","Sophia","Isabella","Mia","Charlotte","Abigail","Emily","Harper"]
  @last_names ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez"]

  defp get_name(name_list), do: name_list |> Enum.random
  defp get_age, do: 1..100 |> Enum.random

  def make do
    %{first_name: get_name(@first_names), last_name: get_name(@last_names), age: get_age()}
  end
  def make_more(n) when n == 0, do: []
  def make_more(n) when is_integer(n) and n > 0, do: [make() | make_more(n - 1)]

end


defmodule PersonMatcher do
	def age_match(persons, age_target) do 
		for person <- persons, person.age == age_target, do: person
	end
end
