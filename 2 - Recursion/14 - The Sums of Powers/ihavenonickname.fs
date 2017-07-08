module Program
    open System

    let powers n p =
        [ for i in 1.0 .. 1.0 .. (sqrt n) -> (float i) ** p ]

    let rec countAllSums target parcialSum possibilities =
        match possibilities with
        | [] -> if parcialSum = target then 1 else 0
        | h::t ->
            if parcialSum = target
            then 1
            else
                if parcialSum > target
                then 0
                else
                    let a = countAllSums target parcialSum t
                    let b = countAllSums target (parcialSum + h) t

                    a + b

    [<EntryPoint>]
    let main args =
        let n = Console.ReadLine() |> float
        let p = Console.ReadLine() |> float

        printfn "%d" (countAllSums n 0.0 (powers n p))

        Console.ReadKey() |> ignore

        0
