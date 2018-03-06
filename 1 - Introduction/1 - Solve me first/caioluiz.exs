defmodule Solution do
    def adder(a, b) do
        a + b
    end
end

{a, _ } = IO.gets("") |> Integer.parse
{b, _ } = IO.gets("") |> Integer.parse
IO.puts Solution.adder(a, b) 
