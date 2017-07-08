open System

let readNumberLine () =
    Console.ReadLine()
    |> (fun line -> line.Split(' '))
    |> Array.map float

let integral f left right =
    let dx = 0.001
    Seq.sum [ for x in left .. dx .. right -> (f x) * dx ]

let polynomialExpr aSeq bSeq x =
    Seq.zip aSeq bSeq
    |> Seq.sumBy (fun (a, b) -> a * (x ** b))

let rotate f x =
    let y = f x
    y * y * Math.PI

let area aSeq bSeq left right =
    integral (polynomialExpr aSeq bSeq) left right

let volume aSeq bSeq left right =
    integral (rotate <| polynomialExpr aSeq bSeq) left right

[<EntryPoint>]
let main args =
    let aSeq = readNumberLine ()
    let bSeq = readNumberLine ()
    let [|left; right|] = readNumberLine ()

    printfn "%f" (area aSeq bSeq left right)
    printfn "%f" (volume aSeq bSeq left right)

    0
