open System

let big1 = bigint 1
let big2 = bigint 2
let big3 = bigint 3

let formulae n =
    (n * (big3 * n - big1)) / big2

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int

    seq { 1 .. n }
    |> Seq.map (fun _ -> Console.ReadLine())
    |> Seq.map int
    |> Seq.map bigint
    |> Seq.map formulae
    |> Seq.iter (printfn "%O")

    0
