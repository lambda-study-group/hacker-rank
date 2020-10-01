open System

let isInRange n =
    n >= 1 && n <= 1000

let sum a b =
    match (a |> isInRange, b |> isInRange) with
    | (true, true) -> Some(a + b)
    | _ -> None

[<EntryPoint>]
let main argv = 
    let first = Int32.TryParse(Console.ReadLine())
    let second = Int32.TryParse(Console.ReadLine())

    match (first |> fst, second |> fst) with
    | (true, true) ->
        let a = first |> snd
        let b = second |> snd 

        match sum a b with
        | Some(n) -> printfn "%i" n
        | None -> printfn "a or b out of range"
    | _ -> printfn "a or b not a number"

    0 // return an integer exit code
