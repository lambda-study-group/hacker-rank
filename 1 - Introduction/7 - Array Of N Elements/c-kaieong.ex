n = IO.gets("Enter integer")
|> String.trim
|> String.to_integer

Enum.map(0..n-1, fn(x) -> x end)
