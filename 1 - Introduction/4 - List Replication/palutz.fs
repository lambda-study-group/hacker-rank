open System 

// recursive append to a list from console (only if Int)
let rec recInp (acc: int list) =
  let n = Console.ReadLine()
  match System.Int32.TryParse n with 
  | true, i -> recInp (List.append acc [i])
  | _ -> acc

[<EntryPoint>]
let main args = 
  let n = Console.ReadLine() |> int
  let l = recInp []
  l |> List.replicate n 
    |> List.concat 
    |> List.sort 
    |> List.iter (fun x -> printfn "%d" x)
  0
