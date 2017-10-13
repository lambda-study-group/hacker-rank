module Main where

import           Control.Monad (forM_)


solve :: String -> Bool
solve = go 0 0 0 0
  where
    go r g y b []     = (r == g) && (y == b)
    go r g y b (x:xs) = if (abs (r-g) <= 1) && (abs (y-b) <= 1)
                        then case x of
                               'R' -> go (r+1) g y b xs
                               'G' -> go r (g+1) y b xs
                               'Y' -> go r g (y+1) b xs
                               'B' -> go r g y (b+1) xs
                        else False


main :: IO ()
main = do
    t <- read <$> getLine
    forM_ [1..t] $ \_ -> do
        s <- getLine
        print (solve s)
