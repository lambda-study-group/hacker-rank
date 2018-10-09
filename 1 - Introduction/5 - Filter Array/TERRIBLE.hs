f :: Int -> [Int] -> [Int]
f 0 _ = []
f n [] = []
f n (x:xs) = case x < n of
               True -> (++) [x] (f n xs)
               False -> f n xs


main = do 
    n <- readLn :: IO Int 
    inputdata <- getContents 
    let 
        numbers = map read (lines inputdata) :: [Int] 
    putStrLn . unlines $ (map show . f n) numbers
