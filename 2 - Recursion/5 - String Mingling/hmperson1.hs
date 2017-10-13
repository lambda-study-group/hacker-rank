module Main where


mingle :: String -> String -> String
mingle p q = concat (zipWith (\pi qi -> [pi,qi]) p q)


main :: IO ()
main = do
    p <- getLine
    q <- getLine
    putStrLn (mingle p q)
