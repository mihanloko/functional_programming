module Lib
    ( someFunc,
    intersect
    ) where

import Data.List (foldl')
someFunc :: IO ()
someFunc = print (intersect [[1,2,4,5], [4..6], [5,6,7], [8,9,5]])

intersect :: Integral a => [[a]] -> [a]
intersect [] = []
intersect x = if length x == 1 then head x else intersect ([intersect' (head x) (head (tail x))] ++ (tail (tail x)))

intersect' :: Integral a => [a] -> [a] -> [a]
intersect' [] _ = []
intersect' (h:t) y = if h `elem` y then h:intersect' t y else intersect' t y


