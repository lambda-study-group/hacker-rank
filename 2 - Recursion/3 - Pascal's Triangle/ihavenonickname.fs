open System

let rec cell row column =
    if column > 0 && row <> column
    then cell (row - 1) (column - 1) + cell (row - 1) column
    else 1

let row i =
    seq { for column in 0 .. i -> cell i column }
    |> Seq.map string
    |> String.concat " "

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int |> ((+)(-1))

    seq { for i in 0 .. n -> row i }
    |> Seq.iter (printfn "%s")

    0
