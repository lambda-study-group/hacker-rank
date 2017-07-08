module Program
    open System

    let count x =
        Seq.filter ((=)x) >> Seq.length

    let difference x x' xs =
        abs (count x xs - count x' xs)

    let thereAreAsMany x x' xs =
        difference x x' xs = 0

    let differenceIsAtMost1 x x' xs =
        let checker acc c =
            match abs acc > 1 with
            | true -> acc
            | false when c = x -> acc + 1
            | false when c = x' -> acc - 1
            | _ -> acc

        let difference = Seq.fold checker 0 xs

        abs difference <= 1

    let verify xs =
        thereAreAsMany 'R' 'G' xs &&
        thereAreAsMany 'Y' 'B' xs &&
        differenceIsAtMost1 'R' 'G' xs &&
        differenceIsAtMost1 'Y' 'B' xs

    [<EntryPoint>]
    let main args =
        let n = Console.ReadLine() |> int

        Seq.initInfinite (fun _ -> Console.ReadLine())
        |> Seq.take n
        |> Seq.map verify
        |> Seq.map (fun ok -> if ok then "True" else "False")
        |> Seq.iter (printfn "%s")

        0
