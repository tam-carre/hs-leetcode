module Problems.LC226.TamCarre (invertTree) where

import Problems.BinaryTree (BinaryTree (Leaf, Node))

invertTree :: BinaryTree a -> BinaryTree a
invertTree Leaf                  = Leaf
invertTree (Node val left right) = Node val (invertTree right) (invertTree left)
