module Problems.LC242.TamCarre (isAnagram) where

import Data.List (sort)

isAnagram :: String -> String -> Bool
isAnagram x y = sort x == sort y
