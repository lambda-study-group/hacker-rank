open System

let parse (str: string) =
    match str.Split(' ') with
    | [|a; b|] -> int a, int b
    | _ -> failwith "Ops"

let rec gcd a b =
    if a = b || a < 0 || b < 0
    then a
    else
        if a > b
        then gcd (a - b) b
        else gcd a (b - a)

let countDivisors n =
    seq { for i in 1 .. n do if n % i = 0 then yield 1 }
    |> Seq.sum

[<EntryPoint>]
let main args =
    let n = Console.ReadLine() |> int

    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.take n
    |> Seq.map parse
    |> Seq.map (fun (a, b) -> gcd a b)
    |> Seq.map countDivisors
    |> Seq.iter (printfn "%d")

    0
