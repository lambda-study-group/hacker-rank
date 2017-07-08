open System

let rec fibo = function
    | 0 -> 0
    | 1 -> 0
    | 2 -> 1
    | n -> fibo (n - 1) + fibo (n - 2)

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int

    printfn "%d" (fibo n)

    0
