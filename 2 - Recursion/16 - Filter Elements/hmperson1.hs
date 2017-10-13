module Main where

import           Control.Monad (forM_)
import           Data.List     (intercalate)


solve :: Int -> Int -> [Int] -> [Int]
solve n k = map fst . filter ((>= k) . snd) . reverse . foldl f []
  where
    f [] e = [(e,1)]
    f xs e = if any ((== e) . fst) xs
             then map (\(x,r) -> if x==e then (x,r+1) else (x,r)) xs
             else (e,1):xs


main :: IO ()
main = do
    t <- read <$> getLine
    forM_ [1..t] $ \_ -> do
        [n,k] <- map read . words <$> getLine
        a <- map read . words <$> getLine
        let soln = solve n k a
        if not (null soln)
          then putStrLn . intercalate " " . map show $ soln
          else print (-1)
