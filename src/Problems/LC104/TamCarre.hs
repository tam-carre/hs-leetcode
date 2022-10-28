module Problems.LC104.TamCarre (maxDepth) where

import Problems.BinaryTree (BinaryTree (Node, Leaf))

maxDepth :: BinaryTree a -> Int
maxDepth Leaf                = 0
maxDepth (Node _ left right) = 1 + max (maxDepth left) (maxDepth right)
