import Control.Monad

f :: Int -> [Int] -> [Int]
f n = join . map (take n . repeat)

main :: IO ()
main = getContents >>=
       mapM_ print. (\(n:arr) -> f n arr). map read. words
