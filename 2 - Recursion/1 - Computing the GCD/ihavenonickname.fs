open System

let readNumberLine () =
    Console.ReadLine()
    |> (fun line -> line.Split(' '))
    |> Array.map int

let rec gcd a b =
    match a, b with
    | _ when a > b -> gcd (a - b) b
    | _ when a < b -> gcd a (b - a)
    | _ -> a

[<EntryPoint>]
let main args =
    let [|a; b|] = readNumberLine ()

    printfn "%d" (gcd a b)

    0
