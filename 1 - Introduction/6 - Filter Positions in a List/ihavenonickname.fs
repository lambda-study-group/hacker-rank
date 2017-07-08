open System

let readNumberList () =
    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.takeWhile (fun x -> x <> null)
    |> Seq.map int
    |> Seq.toList

[<EntryPoint>]
let main args =
    readNumberList ()
    |> Seq.chunkBySize 2
    |> Seq.map (Seq.item 1)
    |> Seq.iter (printfn "%O")

    0
