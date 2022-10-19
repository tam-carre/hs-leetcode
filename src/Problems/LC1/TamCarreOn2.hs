module Problems.LC1.TamCarreOn2 (twoSum) where

import Data.Foldable (find)

-- | O(n^2)
twoSum :: [Int] -> Int -> (Int, Int)
twoSum ints = findMatch intsWithIndices
  where
  intsWithIndices = zip [0..] ints

  findMatch [] _ = error "not found"
  findMatch (x:xs) target =
    case find (isMatch target x) intsWithIndices of
      Nothing    -> findMatch xs target
      Just (i,_) -> (fst x, i)

  isMatch target (i,x) (j,m) = x + m == target && i /= j
