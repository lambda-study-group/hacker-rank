defmodule Solution do
  def hello do
    IO.puts "Hello World"
  end
end

{n, _ } = IO.gets("") |> Integer.parse

0..n-1
|> Enum.each(fn _ -> Solution.hello end);
