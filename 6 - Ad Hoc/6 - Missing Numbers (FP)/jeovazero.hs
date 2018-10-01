main = do
    a <- getLine
    la <- getList
    let qla = qs la

    b <- getLine
    lb <- getList
    let qlb = qs lb

    let dd = diff qla qlb
    printList dd


getList :: IO [Int]
getList = do
    x <- getLine
    let y = [ p | e <- words x, let p = read e :: Int]
    return y

printList :: [Int] -> IO()
printList lst
  | lst == [] = do
      putStrLn ""
      return ()
  | otherwise = do
      let s = if (tail lst) /= [] then " " else ""
      putStr $ show (head lst) ++ s
      printList (tail lst)

qs :: Ord a => [a] -> [a]
qs [] = []
qs (h:tail) = (qs l) ++ [h] ++ (qs g)
    where   l = filter (< h) tail
            g = filter (>= h) tail

diff :: [Int] -> [Int] -> [Int]
diff [] b = b
diff a [] = a
diff (ha:ta) (hb:tb)
  | ha == hb = diff ta tb
  | ha < hb = (ha:diff (rp ta ha) (hb:tb))
  | otherwise = (hb:diff (ha:ta) (rp tb hb))
  where rp lst i
         | head lst == i = tail lst
         | otherwise = lst


