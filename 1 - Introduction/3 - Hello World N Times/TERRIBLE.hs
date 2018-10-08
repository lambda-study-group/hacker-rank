nTimes :: Int -> IO ()
nTimes n = case 0 < n && n <= 50 of
            True -> mapM_ putStrLn . take n $repeat "Hello World"
            False -> error "Your input must be less than 50 and more than 0."

main :: IO()
main = do
    val1 <- readLn
    nTimes val1
