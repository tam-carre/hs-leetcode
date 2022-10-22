-- | [Common to all implementations]
module Problems.LC206.NodeList (NodeList (Node, Empty)) where

data NodeList a
  = Node a (NodeList a)
  | Empty
  deriving (Eq)
