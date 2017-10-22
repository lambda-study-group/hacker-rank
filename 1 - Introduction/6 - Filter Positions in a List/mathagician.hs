f :: [Int] -> [Int]
f lst = [(lst !! x) | x <- [0..(length lst)-1], odd x]

-- This part deals with the Input and Output and can be used as it is. Do not modify it.
main = do
   inputdata <- getContents
   mapM_ (putStrLn. show). f. map read. lines $ inputdata
