import Control.Monad

f (p1, p2) (q1, q2) = fromIntegral (p1 * q2 - q1 * p2)

area lst = 0.5 * fromIntegral (abs . sum $ zipWith f lst (tail lst))

main = do
    n <- fmap (read::String->Int) getLine
    func <- forM [1..n] (\_->do
      fmap ((\[a, b]->(a,b)) . map (read::String->Int).words) getLine :: IO (Int, Int))
    putStrLn $ show (area (func ++ take 1 func))
