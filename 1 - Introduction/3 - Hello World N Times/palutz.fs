open System

[<EntryPoint>]
let main args =
  // printfn "Insert the number (between 0 and 50) of times you want 'Hello World' to be printed out"
  let n = Console.ReadLine() |> int
  if (n >= 0) && (n <= 50) then
    for x = 1 to n do printfn "Hello World"
  else
    ()
  0
