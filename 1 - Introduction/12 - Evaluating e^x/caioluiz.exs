defmodule Solution do
  def fact(0), do: 1

  def fact(n) do
    Enum.reduce(1..n, 1, fn x, acc -> x*acc end)
  end
  
  def e(x) do
    0..9
    |> Enum.map(fn a -> :math.pow(x, a)/fact(a) end)
    |> Enum.reduce(0, fn a, acc -> a + acc end)
  end
end

{n, _ } = IO.gets("") |> Integer.parse
IO.stream(:stdio, :line)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_float/1)
    |> Enum.map(&Solution.e/1)
    |> Enum.each(&IO.puts/1)
