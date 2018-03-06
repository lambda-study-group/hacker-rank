defmodule Solution do
  def update_list([], _f), do: []
  
  def update_list([head | tail], f) do
    [f.(head) | update_list(tail, f)]
  end
  
end

IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  |> Solution.update_list(&abs/1)
  |> Enum.each &IO.puts/1
