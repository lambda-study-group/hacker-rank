mdc :: Integral a => a -> a -> a
mdc a b
  | mm == 0 = b
  | otherwise = mdc b mm
  where mm = mod a b

mmc :: Integral a => a -> a -> a
mmc a b = (a * b) `div` (mdc a b)

reduce :: Eq a => (a -> a -> a) -> [a] -> a
reduce op (h:g:t)
  | t == [] = ans
  | otherwise = reduce op (ans:t)
  where ans = op h g

main = do
    n <- getLine
    s <- getLine
    print $ reduce mmc [x | ss <- (words s), let x = read ss::Integer]
