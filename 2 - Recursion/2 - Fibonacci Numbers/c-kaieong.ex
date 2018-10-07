defmodule Main do
  def fibonacci(n, acc \\ 0) do
    case n do
      0 -> acc
      1 -> 1
      2 -> 1
      _ -> fibonacci(n-1, acc) + fibonacci(n-2, acc)
    end
  end
end

IO.gets("Enter iterations\n") |> String.trim |> String.to_integer |> Main.fibonacci
