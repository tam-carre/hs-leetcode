module LC102Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests)

import Problems.BinaryTree (BinaryTree (Leaf, Node))
import qualified Problems.LC102.TamCarre

spec :: Spec
spec = runTests implementations cases

implementations :: [BinaryTree a -> [[a]]]
implementations =
  [ Problems.LC102.TamCarre.levelOrder
  ]

dummyTree1 :: BinaryTree Int
dummyTree1 = Node 3 (Node 9 Leaf Leaf) (Node 20 (Node 15 Leaf Leaf) (Node 7 Leaf Leaf))

dummyTree2 :: BinaryTree Int
dummyTree2 = Node 1 Leaf Leaf

dummyTree3 :: BinaryTree Int
dummyTree3 = Leaf

cases :: [(BinaryTree Int, [[Int]] -> Bool)]
cases =
  [ (dummyTree1, (==) [[3], [9,20], [15,7]])
  , (dummyTree2, (==) [[1]])
  , (dummyTree3, (==) [])
  ]
