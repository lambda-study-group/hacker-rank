open System

let rotate (str: string) n =
    let front = Seq.skip n str
    let back = Seq.take n str

    String.Concat(Seq.append front back)

let rotations str =
    let n = Seq.length str

    seq { 1 .. n }
    |> Seq.map (fun i -> rotate str i)

[<EntryPoint>]
let main argv =
    let n = Console.ReadLine() |> int

    Seq.initInfinite (fun _ -> Console.ReadLine())
    |> Seq.take n
    |> Seq.map rotations
    |> Seq.map (String.concat " ")
    |> Seq.iter (printfn "%s")

    0
