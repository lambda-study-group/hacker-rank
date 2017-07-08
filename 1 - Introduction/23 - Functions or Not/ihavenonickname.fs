open System

let readList n parser =
    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.take n
    |> Seq.map parser
    |> Seq.toList

let parseRelation (s: string) =
    match s.Split(' ') with
    | [|x|] -> int x, None
    | [|k; v|] -> int k, Some (int v)
    | _ -> failwith "OhGodWhy"

let isFunc relations =
    relations
    |> Map.ofList
    |> Map.toSeq
    |> Seq.length
    |> (=) (List.length relations)

let boolStr = function
    | true -> "YES"
    | false -> "NO"

let readTestCase () =
    let n = int <| Console.ReadLine()

    readList n parseRelation

[<EntryPoint>]
let main args =
    let t = int <| Console.ReadLine()

    Seq.initInfinite (fun _ -> readTestCase ())
    |> Seq.take t
    |> Seq.map isFunc
    |> Seq.map boolStr
    |> Seq.iter (printfn "%s")

    0
