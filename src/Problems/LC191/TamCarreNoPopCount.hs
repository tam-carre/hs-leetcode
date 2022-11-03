module Problems.LC191.TamCarreNoPopCount (hammingWeight) where

import Data.Bits ((.&.))

hammingWeight :: Int -> Int
hammingWeight 0 = 0
hammingWeight x = 1 + hammingWeight (x .&. (x - 1))
