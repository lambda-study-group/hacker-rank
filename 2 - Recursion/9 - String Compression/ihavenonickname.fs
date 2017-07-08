open System

let consecutiveRepetitions xs =
    let head = List.head xs
    List.takeWhile ((=) head) xs

let compress xs =
    let rec compress' parcial xs' =
        match xs' with
        | [] -> parcial
        | _ ->
            let consec = consecutiveRepetitions xs'
            let nRepet = List.length consec
            let charac = List.head consec

            compress' ((charac, nRepet)::parcial) (List.skip nRepet xs')

    compress' [] xs |> List.rev

[<EntryPoint>]
let main args =
    Console.ReadLine()
    |> Seq.toList
    |> compress
    |> List.map (fun (c, n) -> if n = 1 then string c else string c + string n)
    |> String.concat ""
    |> (printfn "%s")

    0
