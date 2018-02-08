defmodule Solution do
  def filter(_, []), do: []
  def filter(n, [head | tail]) when head >= n, do: filter(n, tail)
  def filter(n, [head | tail]), do: [ head | filter(n, tail)]
end 

n = IO.gets("") |> String.trim |> String.to_integer
list = IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  |> Solution.filter(n)
  |> Enum.each(&IO.puts/1)
