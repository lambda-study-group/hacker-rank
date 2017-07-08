open System

let mingling s1 s2 =
    Seq.zip s1 s2
    |> Seq.map (fun (a, b) -> [ a; b ])
    |> Seq.concat
    |> Seq.map string
    |> String.concat ""

[<EntryPoint>]
let main argv =
    let p = Console.ReadLine()
    let q = Console.ReadLine()

    printfn "%s" (mingling p q)

    0
