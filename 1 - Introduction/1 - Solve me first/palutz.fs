open System

let sum a b = a + b

[<EntryPoint>]
let main argv = 
  let a = Console.ReadLine() |> int
  let b = Console.ReadLine() |> int
  printfn "%d" (sum a b)
  0

