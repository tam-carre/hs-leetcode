module Problems.LC1.TamCarreOn (twoSum) where

import qualified Data.Map as Map

-- | O(n)
twoSum :: [Int] -> Int -> (Int, Int)
twoSum ints target = findAnswer (zip [0..] ints) Map.empty
  where
  findAnswer ((i,x):xs) indices = case Map.lookup (target - x) indices of
    Nothing -> findAnswer xs (Map.insert x i indices)
    Just j  -> (i,j)
