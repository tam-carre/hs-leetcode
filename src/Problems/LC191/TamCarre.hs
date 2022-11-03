module Problems.LC191.TamCarre (hammingWeight) where

import Data.Bits (popCount)

hammingWeight :: Int -> Int
hammingWeight = popCount
