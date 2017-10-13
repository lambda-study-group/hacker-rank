module Main where

import           Control.Monad (forM_)


permute :: String -> String
permute = concat . map reverse . chunksOf2
  where
    chunksOf2 []       = []
    chunksOf2 (a:b:xs) = [a,b] : chunksOf2 xs


main :: IO ()
main = do
    t <- read <$> getLine
    forM_ [1..t] $ \_ -> do
        word <- getLine
        putStrLn (permute word)
