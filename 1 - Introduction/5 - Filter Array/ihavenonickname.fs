open System

let readNumberList () =
    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.takeWhile (fun x -> x <> null)
    |> Seq.map int
    |> Seq.toList

[<EntryPoint>]
let main args =
    let n = int <| Console.ReadLine()

    readNumberList ()
    |> Seq.where ((>) n)
    |> Seq.iter (printfn "%d")

    0
