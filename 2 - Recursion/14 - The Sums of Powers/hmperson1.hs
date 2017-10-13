module Main where


solve :: Int -> Int -> Int
solve x n = go x powers
  where
    go 0   _      = 1
    go _   []     = 0
    go tgt (c:cs) = if c > tgt then 0 else go (tgt-c) cs + go tgt cs

    powers = map (^ n) [1..upper]
    upper  = floor ((fromIntegral x) ** (1.0 / fromIntegral n)) :: Int


main :: IO ()
main = do
    x <- read <$> getLine
    n <- read <$> getLine
    print (solve x n)
