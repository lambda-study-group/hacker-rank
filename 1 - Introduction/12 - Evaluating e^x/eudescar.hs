round' :: RealFloat a => a -> a
round' num = (fromIntegral $ round (num * 10000)) / 10000

exp' x = round' $ sum [x**k / (product [1..k]) | k <- [0..9]]

main :: IO ()
main = getContents >>=
       mapM_ print. map exp'. map (read::String->Double). tail. words
