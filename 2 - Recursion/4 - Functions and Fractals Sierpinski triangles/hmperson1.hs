module Main where

import           Data.List (intercalate)


triangle :: Int -> [String]
triangle n = map srow [0..tsize]
  where
    tsize = 2 ^ (5-n) - 1
    srow i = replicate (tsize-i) '_' ++ replicate (2*i+1) '1' ++ replicate (tsize-i) '_'

sierpinski :: Int -> Int -> [String]
sierpinski 0 n0 = triangle n0
sierpinski n n0 = map pad prev ++ zipWith (\l r -> l++"_"++r) prev prev
  where
    prev = sierpinski (n-1) n0
    pad row = let padLen = 2^(4-(n0-n)) in replicate padLen '_' ++ row ++ replicate padLen '_'


main :: IO ()
main = do
    input <- getLine
    putStrLn . intercalate "\n" . (\n -> sierpinski n n) . read $ input

