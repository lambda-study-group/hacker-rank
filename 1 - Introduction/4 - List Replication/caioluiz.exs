defmodule Solution do
    def duplicate_num(num, n) do
        0..n-1
        |> Enum.reduce([], fn _, acc -> [num|acc] end)
    end

	def duplicate_list(list, n) do
		Enum.map(list, fn num -> duplicate_num(num, n) end)
	end
end

{n, _ } = IO.gets("") |> Integer.parse
list = IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  |> Solution.duplicate_list(n)
  |> List.flatten
  |> Enum.each(&IO.puts/1)

