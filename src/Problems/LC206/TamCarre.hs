module Problems.LC206.TamCarre (reverseList) where

import Problems.LC206.NodeList (NodeList (Node, Empty))

reverseList :: NodeList a -> NodeList a
reverseList = loop Empty where
  loop reversed Empty          = reversed
  loop reversed (Node val nxt) = loop (Node val reversed) nxt
