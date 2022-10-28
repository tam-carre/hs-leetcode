module LC100Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests2)

import Problems.BinaryTree (BinaryTree (Leaf, Node))
import qualified Problems.LC100.TamCarre

spec :: Spec
spec = runTests2 implementations cases

implementations :: Eq a => [BinaryTree a -> BinaryTree a -> Bool]
implementations =
  [ Problems.LC100.TamCarre.isSameTree
  ]

dummyTree1 :: BinaryTree Int
dummyTree1 = Node 3 (Node 9 Leaf Leaf) (Node 20 (Node 15 Leaf Leaf) (Node 7 Leaf Leaf))

dummyTree2 :: BinaryTree Int
dummyTree2 = Node 1 Leaf (Node 2 Leaf Leaf)

cases :: [(BinaryTree Int, BinaryTree Int, Bool -> Bool)]
cases =
  [ (dummyTree1, dummyTree1, (==) True)
  , (dummyTree2, dummyTree2, (==) True)
  , (dummyTree1, dummyTree2, (==) False)
  ]
