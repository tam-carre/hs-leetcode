module Problems.LC206.TamCarre (reverseList) where

import Problems.LinkedList (Linked (Cons, End))

reverseList :: Linked a -> Linked a
reverseList = loop End where
  loop reversed End            = reversed
  loop reversed (Cons val nxt) = loop (Cons val reversed) nxt
