module Problems.LC1.TamCarreOn2 (twoSum) where

import Data.Foldable (find)

-- | O(n^2)
twoSum :: [Int] -> Int -> (Int, Int)
twoSum ints target = findAnswer intsWithIndices
  where
  intsWithIndices = zip [0..] ints

  findAnswer (x:xs) = case find (isMatch x) intsWithIndices of
    Nothing    -> findAnswer xs
    Just (i,_) -> (fst x, i)

  isMatch (i,x) (j,m) = x + m == target && i /= j
