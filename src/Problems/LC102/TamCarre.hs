module Problems.LC102.TamCarre (levelOrder) where

import Problems.BinaryTree (BinaryTree (Leaf, Node))

levelOrder :: BinaryTree a -> [[a]]
levelOrder Leaf = []
levelOrder (Node val left right) =
  [[val]] ++ zipWithNoDiscard (++) (levelOrder left) (levelOrder right)

zipWithNoDiscard :: (a -> a -> a) -> [a] -> [a] -> [a]
zipWithNoDiscard _f xs     []     = xs
zipWithNoDiscard _f []     ys     = ys
zipWithNoDiscard  f (x:xs) (y:ys) = f x y : zipWithNoDiscard f xs ys
