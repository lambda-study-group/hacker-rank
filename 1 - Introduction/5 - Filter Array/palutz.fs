open System

// Return a list (in the same order) with only the elements that are less than n
let lessThanFilter n a1 =
  let rec loop a2 acc =
    match a2 with
    | x :: xs when x < n -> loop xs (List.append acc [x])
    | x :: xs -> loop xs acc
    | _ -> acc

  loop a1 []

let rec recInp (acc: int list) =
  let n = Console.ReadLine()
  match System.Int32.TryParse n with 
  | true, i -> recInp (List.append acc [i])
  | _ -> acc

[<EntryPoint>]
let main args = 
  let n = Console.ReadLine() |> int
  let l = recInp []
  l |> lessThanFilter n
    |> List.iter (fun x -> printfn "%d" x)
  0
