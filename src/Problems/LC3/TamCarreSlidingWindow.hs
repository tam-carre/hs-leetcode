module Problems.LC3.TamCarreSlidingWindow (lengthOfLongestSubstring) where

import Data.List (nub)

-- | This might have time complexity issues, someone should verify this.
lengthOfLongestSubstring :: String -> Int
lengthOfLongestSubstring = length . longestValidSubList (\s -> s == nub s)

data SlidingWindow a = SW { answer :: [a], wdw :: [a] }

-- | Generic sliding window function
longestValidSubList :: ([a] -> Bool) -> [a] -> [a]
longestValidSubList validWdw list = loop list (SW [] []) where
  loop []       = answer
  loop (x:xs)   = loop xs
                . updateAnsw
                . until (validWdw . wdw) shrinkWdw
                . addToWdw x
  addToWdw x sw = sw { wdw = wdw sw ++ [x] }
  shrinkWdw sw  = sw { wdw = tail $ wdw sw }
  updateAnsw sw = sw { answer = longest (answer sw) (wdw sw) }
  longest a b   = if length a > length b then a else b
