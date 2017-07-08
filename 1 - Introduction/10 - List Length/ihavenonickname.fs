open System

let readNumberList () =
    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.takeWhile (fun x -> x <> null)
    |> Seq.map int
    |> Seq.toList

let rec length = function
    | [] -> 0
    | h::t -> 1 + (length t)

[<EntryPoint>]
let main args =
    readNumberList ()
    |> length
    |> (printfn "%d")

    0
