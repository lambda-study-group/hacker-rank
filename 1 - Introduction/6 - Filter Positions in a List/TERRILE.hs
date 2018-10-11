f :: [Int] -> [Int]
f [] = []
f (_:x:xs) = x : f xs

main = do
	inputdata <- getContents
	mapM_ (putStrLn. show). f. map read. lines $ inputdata
