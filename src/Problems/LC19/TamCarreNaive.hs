module Problems.LC19.TamCarreNaive (removeNthFromEnd) where

import Problems.LinkedList (Linked (..))

-- | O(n) but three passes.
-- TODO: One-pass version (is it possible?)
-- Two passes would be easy (but inelegant) simply by removing the Nth
-- and reversing inside the same recursive function. One-pass would
-- require some serious shenanigans
removeNthFromEnd :: Int -> Linked a -> Linked a
removeNthFromEnd n = reverseList . removeNth n . reverseList

removeNth :: Int -> Linked a -> Linked a
removeNth n = loop 1 where
  loop _ End = End
  loop i (Cons x xs)
    | i == n    = loop (i + 1) xs
    | otherwise = Cons x $ loop (i + 1) xs

reverseList :: Linked a -> Linked a
reverseList = loop End where
  loop reversed End            = reversed
  loop reversed (Cons val nxt) = loop (Cons val reversed) nxt
