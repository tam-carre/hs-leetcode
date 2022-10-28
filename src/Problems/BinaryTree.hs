module Problems.BinaryTree (BinaryTree (..)) where

data BinaryTree a
  -- | Other name for Leaf: Empty, null
  = Leaf
  | Node a (BinaryTree a) (BinaryTree a)
