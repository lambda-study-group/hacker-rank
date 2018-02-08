defmodule Solution do
  def list_len(list) do
    list
      |> Enum.reduce(0, fn _, acc -> 1 + acc end)
  end
end

IO.stream(:stdio, :line)
  |> Enum.map(&String.trim/1)
  |> Solution.list_len
  |> IO.puts
