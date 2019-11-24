import Control.Monad

distance (p1, p2) (q1, q2) = sqrt (fromIntegral (q1 - p1)^2 + fromIntegral (q2 - p2)^2)

perimeter lst = sum $ zipWith distance lst (tail lst)

main = do
    n <- fmap (read::String->Int) getLine
    func <- forM [1..n] (\_->do
      fmap ((\[a, b]->(a,b)) . map (read::String->Int).words) getLine :: IO (Int, Int))
    putStrLn $ show (perimeter (func ++ take 1 func))
