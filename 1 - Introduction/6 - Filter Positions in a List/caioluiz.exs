defmodule Solution do
	def f(list) do	
		filter(list, :yes, [])
	end

	def filter([], _ , result) do result end
	
	def filter([_head | tail], :yes, result) do
		filter(tail, :no, result)
	end
	
	def filter([head | tail], :no, result) do
	  filter(tail, :yes, result ++ [head])
	end
end

IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  |> Solution.f
  |> Enum.each(&IO.puts/1)
