main :: IO()
main = do
    n <- readLn :: IO Int
    mapM_ putStrLn . take n $ repeat "Hello World"
