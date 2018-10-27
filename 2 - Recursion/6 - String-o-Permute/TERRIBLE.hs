swap :: [Char] -> [Char]
swap [] = []
swap [x] = [x]
swap(a:b:xs) = b:a:swap xs

magic :: Int -> IO ()
magic 0 = return ()
magic n = do
  input <- getLine :: IO [Char]
  putStrLn $ swap input
  magic (n-1)

main :: IO ()
main = do
  x <- readLn :: IO Int
  magic x
