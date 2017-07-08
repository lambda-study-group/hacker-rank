module Program
    open System

    let makeString xs =
        xs
        |> Seq.map string
        |> String.concat ""

    [<EntryPoint>]
    let main args =

        let x = Console.ReadLine()
        let y = Console.ReadLine()

        let p =
            Seq.zip x y
            |> Seq.takeWhile (fun (a, b) -> a = b)
            |> Seq.map fst
            |> makeString

        let x' =
            Seq.skip (Seq.length p) x
            |> makeString

        let y' =
            Seq.skip (Seq.length p) y
            |> makeString

        printfn "%d %s" (Seq.length p) p
        printfn "%d %s" (Seq.length x') x'
        printfn "%d %s" (Seq.length y') y'

        0
