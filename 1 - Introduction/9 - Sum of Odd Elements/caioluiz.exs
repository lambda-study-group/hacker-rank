defmodule Solution do
	def sum_odd(list) do
	  list
	    |> Enum.filter(fn x -> rem(x, 2) != 0 end)
	    |> Enum.reduce(fn x, acc -> x + acc end)
	end
end

IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  |> Solution.sum_odd()
