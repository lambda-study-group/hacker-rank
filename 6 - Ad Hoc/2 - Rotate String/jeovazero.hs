main = do
    x <- getLine
    let n = read x :: Int
    l <- getLines n
    exec l

exec :: [String] -> IO ()
exec list
  | [] == list = return ()
  | otherwise = do
      rotateStr (head list) (length (head list))
      exec (tail list)

rotateStr :: [Char] -> Int -> IO ()
rotateStr (h:t) n
  | 0 == n = return ()
  | otherwise = do
      let l = t ++ [h]
      putStr $ l ++ if n == 1 then "\n" else " "
      rotateStr l (n-1)


getLines :: Int -> IO [String]
getLines n
  | 0 == n = return []
  | otherwise = do
      hs <- getLine
      ts <- getLines(n-1)
      let list = (hs:ts)
      return list
