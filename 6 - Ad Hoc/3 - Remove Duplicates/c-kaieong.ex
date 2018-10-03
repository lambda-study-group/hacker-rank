IO.gets("Enter string")
|> String.trim
|> String.split("", trim: true)
|> Enum.uniq
|> List.to_string
