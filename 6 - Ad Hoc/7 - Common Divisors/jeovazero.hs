main = do
  ti <- getLine
  let t = read ti :: Int
  teststr <- readLines t
  let tests = [   (x,y) | e <- teststr,
                  let (x,y) = (read ee :: Int, read ff :: Int ) where [ee,ff] = words e]
  let ans = [x | e <- tests, let x = exec e]
  printList ans

readLines :: Int -> IO [String]
readLines n
| n == 0 = return []
| otherwise = do
      xh <- getLine
      xt <- readLines (n-1)
      let list = (xh:xt)
      return list


printList :: [Int] -> IO ()
printList list
| list == [] = return ()
| otherwise = do
    print $ (head list)
    printList (tail list)

mdc :: (Integral a) =>  a -> a -> a
mdc a b
| m == 0 = b
| otherwise = mdc b m
  where m = mod a b

exec :: (Int, Int) -> Int
exec (x, y) = sum [ 1 | e <- [1..m], mod m e == 0 ] where m = mdc x y
