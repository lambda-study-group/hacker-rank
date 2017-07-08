open System

[<EntryPoint>]
let main argv =
    Console.ReadLine() |> ignore

    let A =
        Console.ReadLine().Split(' ')
        |> Array.map int
        |> Array.countBy id
        |> Map.ofArray

    Console.ReadLine() |> ignore

    Console.ReadLine().Split(' ')
    |> Array.map int
    |> Array.countBy id
    |> Array.filter (fun (x, count) -> (Map.find x A) < count)
    |> Array.map fst
    |> Array.sort
    |> Array.map string
    |> String.concat " "
    |> (printfn "%s")

    0
