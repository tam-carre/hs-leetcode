module Problems.LC3.TamCarreSlidingWindow (lengthOfLongestSubstring) where

import qualified Data.Set as Set

-- | TODO: time complexity verification
lengthOfLongestSubstring :: String -> Int
lengthOfLongestSubstring = length . longestValidSubList hasNoDupes where
  hasNoDupes xs = length xs == length (Set.fromList xs)

data SlidingWindow a = SW { answer :: [a], wdw :: [a] }

-- | Generic sliding window function
longestValidSubList :: ([a] -> Bool) -> [a] -> [a]
longestValidSubList validWdw list = loop list (SW [] []) where
  loop []             = answer
  loop (x:xs)         = loop xs
                      . updateAnsw
                      . until (validWdw . wdw) shrinkWdw
                      . addToWdw x
  addToWdw x (SW a w) = SW a (w ++ [x])
  shrinkWdw  (SW a w) = SW a (tail w)
  updateAnsw (SW a w) = SW (longest a w) w
  longest a b         = if length a > length b then a else b
