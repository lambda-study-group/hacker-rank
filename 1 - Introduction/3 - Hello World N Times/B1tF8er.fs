let ``hello-worlds`` n =
    match (n >= 0 && n <= 50) with
    | true ->
        for _ in [1 .. n] do
            printfn "Hello World"
    | false -> ()
