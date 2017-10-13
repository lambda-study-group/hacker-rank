module Main where

import           Data.List (intercalate)


prefixCompress :: String -> String -> (String, String, String)
prefixCompress x y = (take prefixLen x, drop prefixLen x, drop prefixLen y)
  where
    prefixLen = length . takeWhile id $ zipWith (==) x y


main :: IO ()
main = do
    x <- getLine
    y <- getLine
    let (p,x',y') = prefixCompress x y
    let format s = show (length s) ++ " " ++ s
    putStrLn (format p)
    putStrLn (format x')
    putStrLn (format y')
