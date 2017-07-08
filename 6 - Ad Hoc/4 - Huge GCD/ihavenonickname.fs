open System

let bigzero = bigint 0

let readBigNumber () =
    Console.ReadLine() |> ignore

    Console.ReadLine().Split(' ')
    |> Array.map int
    |> Array.map bigint
    |> Array.fold ( * ) (bigint 1)

let rec gcd (a: bigint) (b: bigint) =
    if b = bigzero
    then abs a
    else gcd b (a % b)

[<EntryPoint>]
let main args =
    let a = readBigNumber ()
    let b = readBigNumber ()
    let res = gcd a b

    printfn "%O" (res % (bigint 1000000007))

    0
