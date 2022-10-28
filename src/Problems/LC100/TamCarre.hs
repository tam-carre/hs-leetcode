module Problems.LC100.TamCarre (isSameTree) where

import Problems.BinaryTree (BinaryTree (Leaf, Node))

isSameTree :: Eq a => BinaryTree a -> BinaryTree a -> Bool
isSameTree Leaf Leaf = True
isSameTree Leaf _    = False
isSameTree _    Leaf = False
isSameTree (Node val left right) (Node val' left' right') =
  val == val' && isSameTree left left' && isSameTree right right'
