module Problems.LC53.TamCarre (maxSubArray) where

import Data.List.NonEmpty (NonEmpty ((:|)))

maxSubArray :: NonEmpty Int -> Int
maxSubArray (x:|xs) = maximum $ scanl f x xs where
  f acc cur = if acc > 0 then acc + cur else cur
