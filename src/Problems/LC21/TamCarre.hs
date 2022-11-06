module Problems.LC21.TamCarre (mergeTwoLists) where

import Problems.LinkedList (Linked (Cons, End))

mergeTwoLists :: Linked Int -> Linked Int -> Linked Int
mergeTwoLists = loop End where
  loop answer End         End         = reverseList answer
  loop answer (Cons x xs) End         = loop (Cons x answer) xs  End
  loop answer End         (Cons y ys) = loop (Cons y answer) End ys
  loop answer (Cons x xs) (Cons y ys)
    | x < y     = loop (Cons x answer) xs          (Cons y ys)
    | otherwise = loop (Cons y answer) (Cons x xs) ys

reverseList :: Linked a -> Linked a
reverseList = loop End where
  loop reversed End            = reversed
  loop reversed (Cons val nxt) = loop (Cons val reversed) nxt
