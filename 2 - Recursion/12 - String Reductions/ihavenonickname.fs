module Program
    open System

    [<EntryPoint>]
    let main args =
        Console.ReadLine()
        |> Seq.distinctBy id
        |> Seq.map string
        |> String.concat ""
        |> (printfn "%s")

        0
