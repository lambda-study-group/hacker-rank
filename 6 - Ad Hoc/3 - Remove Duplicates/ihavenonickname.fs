open System

[<EntryPoint>]
let main args =
    Console.ReadLine()
    |> Seq.distinctBy id
    |> Seq.iter (printf "%O")

    0
