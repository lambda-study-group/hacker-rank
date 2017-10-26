open System

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int
    for i = 1 to n do
        printfn "Hello World"
    0