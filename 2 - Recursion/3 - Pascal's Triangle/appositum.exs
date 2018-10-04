defmodule Solution do
  def main do
    {n, _} = IO.gets("") |> Integer.parse()

    pascals()
    |> Enum.take(n)
    |> Enum.map(fn list -> Enum.map(list, &Integer.to_string/1) end)
    |> Enum.map(& Enum.join(&1, " "))
    |> Enum.each(&IO.puts/1)
  end

  def pascals do
    Stream.iterate [1], fn row ->
      zip_with([0] ++ row, row ++ [0], fn x, y -> x + y end)
      |> Enum.to_list()
    end
  end

  defp zip_with(list1, list2, func) do
    Stream.zip(list1, list2)
    |> Stream.map(fn {x, y} -> func.(x, y) end)
  end
end

Solution.main()
