import Control.Monad (replicateM)
import Data.List (nub)

type Table = [(Int, Int)]

isFunction :: Table -> String
isFunction t
  | nub xs == xs = "YES"
  | otherwise = "NO"
  where xs = map fst t

getInt :: IO Int
getInt = fmap read getLine

readInput :: IO (Int, Int)
readInput = do
  lst <- fmap read <$> words <$> getLine
  let [x,y] = lst
  pure  (x,y)

main :: IO ()
main = do
  testCases <- getInt
  table <- replicateM testCases $ getInt >>= (\x -> replicateM x readInput)
  mapM_ (putStrLn . isFunction) table
