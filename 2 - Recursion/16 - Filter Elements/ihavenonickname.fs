open System

let filter k xs =
    xs
    |> Seq.countBy id
    |> Seq.filter (fun (_, c) -> c >= k)
    |> Seq.map fst
    |> Seq.toList

let prepareOutput xs =
    if Seq.isEmpty xs
    then [-1] |> List.toSeq
    else xs

let readList parser =
    Console.ReadLine().Split(' ')
    |> Seq.map parser

let readCase () =
    let [|_; k|] = Console.ReadLine().Split(' ') |> Array.map int
    let xs = readList int
    k, xs

[<EntryPoint>]
let main argv =
    let t = Console.ReadLine() |> int

    seq { 1 .. t }
    |> Seq.map (fun _ -> readCase ())
    |> Seq.map (fun (k, xs) -> filter k xs)
    |> Seq.iter (fun r ->
        r
        |> prepareOutput
        |> Seq.map string
        |> String.concat " "
        |> (printfn "%s"))

    0
