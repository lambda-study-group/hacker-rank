import Data.List
import Data.Maybe

f :: String -> Char -> Int
f inp char = fromJust (findIndex (==char) inp)

main :: IO ()
main = do
    input <- getLine
    let allChars = (map head.group.sort) input
        firstOccurences = map (f input) allChars
        final = sortOn snd (zip allChars firstOccurences)
    putStrLn (map fst final)

