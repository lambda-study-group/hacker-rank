solveMeFirst a b = a + b

main = do
    val1 <- readLn :: IO Int
    val2 <- readLn :: IO Int
    let sum = solveMeFirst val1 val2
    print sum
