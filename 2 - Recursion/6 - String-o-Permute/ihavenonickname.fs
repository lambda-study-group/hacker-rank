open System

let rec swapEvery2 = function
    | a::b::tail -> b::a::(swapEvery2 tail)
    | xs -> xs

let generate str =
    str
    |> Seq.toList
    |> swapEvery2
    |> List.map string
    |> String.concat ""


[<EntryPoint>]
let main args =
    let n = Console.ReadLine() |> int

    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.take n
    |> Seq.map generate
    |> Seq.iter (printfn "%s")

    0
