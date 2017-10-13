module Main where

import           Data.List (intercalate)


pascal :: Int -> [[Int]]
pascal 1 = [[1]]
pascal n = prevTriangle ++ [zipWith (+) ([0] ++ lastRow) (lastRow ++ [0])]
  where
    prevTriangle = pascal (n-1)
    lastRow      = last prevTriangle


main :: IO ()
main = do
    input <- getLine
    let triangleInts = pascal . read $ input
    putStrLn . intercalate "\n" . map (intercalate " " . map show) $ triangleInts
