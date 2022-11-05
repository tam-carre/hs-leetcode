module Problems.LC1358.TamCarreSlidingWindow (numberOfSubstrings) where

-- | Number of substrings containing a, b and c
numberOfSubstrings :: [Char] -> Int
numberOfSubstrings = validSublists containsAbc where
  containsAbc str = all (`elem` str) "abc"

data SlidingWindow a = SW { count :: Int, wdw :: [a] }

validSublists :: ([a] -> Bool) -> [a] -> Int
validSublists validWdw list = loop list (SW 0 []) where
  loop []        = count
  loop (x:xs)    = loop xs . while (validWdw . wdw) (shiftWdw xs) . addToWdw x
  addToWdw x sw  = sw {wdw = x:wdw sw}
  shiftWdw xs sw = sw {count = count sw + length xs + 1, wdw = init (wdw sw)}

while :: (a -> Bool) -> (a -> a) -> a -> a
while p = until (not . p)
