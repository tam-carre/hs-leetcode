module Problems.LC1358.TamCarreSlidingWindow (numberOfSubstrings) where

-- | Number of substrings containing a, b and c
numberOfSubstrings :: [Char] -> Int
numberOfSubstrings = validSublists containsAbc where
  containsAbc str = all (`elem` str) "abc"

data SlidingWindow a = SW { count :: Int, wdw :: [a] }

validSublists :: ([a] -> Bool) -> [a] -> Int
validSublists valid list = loop list (SW 0 []) where
  loop []     = count
  loop (x:xs) = loop xs . until (not . valid . wdw) (shiftWdw xs) . addToWdw x

  addToWdw x  (SW c w) = SW c (x:w)
  shiftWdw xs (SW c w) = SW (c + length xs + 1) (init w)
