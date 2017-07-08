open System

let readPoint () =
    Console.ReadLine()
    |> (fun line -> line.Split(' '))
    |> Array.map int
    |> function | [|a; b|] -> (a, b) | _ -> failwith "ops"

let intSqrt = float >> sqrt

let distance (x1, y1) (x2, y2) =
    let dx = abs (x2 - x1)
    let dy = abs (y2 - y1)

    intSqrt (dx * dx + dy * dy)

let perimeter points =
    let rec perimeter' = function
        | [a; b] -> distance a b
        | h::t ->
            let dist = distance h (List.head t)
            dist + (perimeter' t)
        | _ -> 0.0

    let connected = List.head points :: List.rev points

    perimeter' connected

[<EntryPoint>]
let main args =
    let n = Console.ReadLine() |> int

    Seq.initInfinite (fun _ -> readPoint ())
    |> Seq.take n
    |> Seq.toList
    |> perimeter
    |> (printfn "%f")

    0
