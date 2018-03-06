defmodule Solution do

	def reverse([head | []]) do
		[head]
	end
	
	def reverse([head | tail]) do
		reverse(tail) ++ [head]
	end	
end

list = IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  
Solution.reverse(list)  
  |> Enum.each(&IO.puts/1)
