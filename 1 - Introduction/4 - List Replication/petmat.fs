open System

let f n arr =
    arr |> Seq.distinct
    |> Seq.toList
    |> List.replicate n
    |> List.concat
    |> List.sort

let rec readNumbers (numbers: int list) =
    let n = Console.ReadLine()
    match Int32.TryParse n with
    | true, x -> readNumbers (List.append numbers [x])
    | _ -> numbers

[<EntryPoint>]
let main args = 
    let n = Console.ReadLine() |> int
    let numbers = readNumbers []
    f n numbers |> List.iter (fun x -> printfn "%d" x)
    0
