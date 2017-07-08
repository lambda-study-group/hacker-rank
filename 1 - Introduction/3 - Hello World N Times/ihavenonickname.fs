open System

[<EntryPoint>]
let main args =
    Console.ReadLine()
    |> int
    |> (fun n -> seq { for _ in 1 .. n -> "Hello World" })
    |> Seq.iter (printfn "%s")

    0
