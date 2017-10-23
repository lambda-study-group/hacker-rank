open System

let aFilter i x = if (i % 2 > 0) then Some x else None

// we filter the odd positions (1, 3, 5) so with a 0 based indexed list we filter pos 0,2,4,6 and we return the others
let odder l = 
  l |> List.mapi aFilter 
    |> List.choose (fun x -> x)
 
let rec recInp (acc: int list) =
  let n = Console.ReadLine()
  match System.Int32.TryParse n with 
  | true, i -> recInp (List.append acc [i])
  | _ -> acc

[<EntryPoint>]
let main args = 
  let l = recInp []
  l |> odder
    |> List.iter (fun x -> printfn "%d" x)
  0
