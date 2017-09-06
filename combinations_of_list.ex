defmodule Partlist do

  def _combinations([h|t], acc, compiled) when t != [] do
  	acc = acc ++ [h]
  	combo = [Enum.join(acc, " "), Enum.join(t, " ")]
  	compiled = compiled ++ [combo]
  	_combinations(t, acc, compiled)
  end
  def _combinations(_, _, compiled) do
  	compiled
  end
  def part_list(a) do 
  	Partlist._combinations(a, [], [])
  end
  
end