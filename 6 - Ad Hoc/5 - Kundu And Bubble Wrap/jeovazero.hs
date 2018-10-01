main = do
    s <- getLine
    let [x,y] = [ss | e <- words s, let ss = read e :: Double]
    let z = x * y
    let ans = sum [ b | e <- [1..z], let b = z / e]
    print $ ans