open System

let rec factorial = function
    | n when n <= 1.0 -> 1.0
    | n -> n * (factorial (n - 1.0))

let eSerie x =
    [ for i in 0 .. 9 -> (pown x i) / (factorial (float i))]

let e x =
    eSerie x |> List.reduce (+)

let readList parser =
    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.takeWhile ((<>) null)
    |> Seq.map parser
    |> Seq.toList

[<EntryPoint>]
let main args =
    ignore <| Console.ReadLine()

    readList float
    |> List.map e
    |> List.iter (printfn "%.4f")

    0
