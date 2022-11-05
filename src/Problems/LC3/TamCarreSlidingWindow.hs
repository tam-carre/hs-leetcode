module Problems.LC3.TamCarreSlidingWindow (lengthOfLongestSubstring) where

import Data.List (nub)

data SlidingWindow a = SW { longest :: [a], wdw :: [a] }

-- | TODO: time complexity verification
lengthOfLongestSubstring :: String -> Int
lengthOfLongestSubstring str = loop str (SW "" "") where
  loop []     = length . longest
  loop (x:xs) = loop xs
              . updateLongest
              . until (hasNoDupe . wdw) shrinkWindow
              . addToWindow x

  addToWindow x (SW l w) = SW l (x:w)
  shrinkWindow  (SW l w) = SW l (init w)
  hasNoDupe xs           = xs == nub xs
  updateLongest (SW l w) = SW (if length l > length w then l else w) w
