module Main where


reduce :: String -> String
reduce = foldl f []
  where
    f [] e = [e]
    f xs e = if any (== e) xs then xs else xs ++ [e]


main :: IO ()
main = do
    input <- getLine
    putStrLn . reduce $ input
