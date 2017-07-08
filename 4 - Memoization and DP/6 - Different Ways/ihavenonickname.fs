open System

let cache = new Collections.Generic.Dictionary<int * int, bigint>()

let rec count n k =
    match k with
    | 0 -> bigint 1
    | _ when k = n -> bigint 1
    | _ ->
        if not (cache.ContainsKey((k, n))) then do
            cache.[(k, n)] <- count (n - 1) (k - 1) + count (n - 1) k
        cache.[(k, n)]

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int

    seq { 1 .. n }
    |> Seq.map (fun _ -> Console.ReadLine().Split(' '))
    |> Seq.map (fun arr -> int arr.[0], int arr.[1])
    |> Seq.map (fun (n, k) -> count n k % (bigint 100000007))
    |> Seq.iter (printfn "%O")

    0
