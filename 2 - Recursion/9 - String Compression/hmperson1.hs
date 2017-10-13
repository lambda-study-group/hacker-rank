module Main where


compress :: String -> String
compress = concat . map (\(r,c) -> if r == 1 then [c] else [c] ++ show r) . rle
  where
    rle = foldr f []

    f e []             = [(1,e)]
    f e xxs@((r,c):xs) = if c == e then (r+1,c):xs else (1,e):xxs


main :: IO ()
main = do
    input <- getLine
    putStrLn . compress $ input
