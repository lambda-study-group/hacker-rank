open System

let cache = new Collections.Generic.Dictionary<int, bigint>()

let rec fibonacci n =
    if not (cache.ContainsKey(n)) then do
        cache.[n] <- fibonacci (n - 1) + fibonacci (n - 2)

    cache.[n]

[<EntryPoint>]
let main argv =
    cache.[0] <- bigint 0
    cache.[1] <- bigint 1

    let n = Console.ReadLine() |> int

    seq { 1 .. n }
    |> Seq.map (fun _ -> Console.ReadLine())
    |> Seq.map int
    |> Seq.map fibonacci
    |> Seq.map (fun x -> x % (bigint 100000007))
    |> Seq.iter (printfn "%O")

    0
