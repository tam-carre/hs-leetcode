module LC104Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests)

import Problems.BinaryTree (BinaryTree (Leaf, Node))
import qualified Problems.LC104.TamCarre

spec :: Spec
spec = runTests implementations cases

implementations :: [BinaryTree a -> Int]
implementations =
  [ Problems.LC104.TamCarre.maxDepth
  ]

cases :: [(BinaryTree Int, Int -> Bool)]
cases =
  [ (Node 3 (Node 9 Leaf Leaf) (Node 20 (Node 15 Leaf Leaf) (Node 7 Leaf Leaf)), (==) 3)
  , (Node 1 Leaf (Node 2 Leaf Leaf), (==) 2)
  ]
