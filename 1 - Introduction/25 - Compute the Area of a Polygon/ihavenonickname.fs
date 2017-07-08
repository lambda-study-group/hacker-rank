open System

let readPoint () =
    Console.ReadLine()
    |> (fun line -> line.Split(' '))
    |> Array.map float
    |> function | [|a; b|] -> (a, b) | _ -> failwith "ops"

let area points =
    let rec shoelaceReduction func xs =
        match xs with
        | [] -> 0.0
        | [_] -> 0.0
        | h::t -> (func h (List.head t)) + (shoelaceReduction func t)

    let connected = List.head points :: List.rev points

    let x1y2 = shoelaceReduction (fun (a, _) (_, b) -> a * b) connected
    let y1x2 = shoelaceReduction (fun (_, a) (b, _) -> a * b) connected

    (abs (x1y2 - y1x2)) / 2.0

[<EntryPoint>]
let main args =
    let n = Console.ReadLine() |> int

    Seq.initInfinite (fun _ -> readPoint ())
    |> Seq.take n
    |> Seq.toList
    |> area
    |> (printfn "%f")

    0
