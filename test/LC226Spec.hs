module LC226Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests)

import Problems.BinaryTree (BinaryTree (Leaf, Node))
import qualified Problems.LC226.TamCarre

spec :: Spec
spec = runTests implementations cases

implementations :: [BinaryTree a -> BinaryTree a]
implementations =
  [ Problems.LC226.TamCarre.invertTree
  ]

cases :: [(BinaryTree Int, BinaryTree Int -> Bool)]
cases =
  [ (dummyTree1, (==) dummyTree1Reversed)
  , (dummyTree2, (==) dummyTree2Reversed)
  ]

dummyTree1 :: BinaryTree Int
dummyTree1 =
  Node 4
    (Node 2
      (Node 1 Leaf Leaf)
      (Node 3 Leaf Leaf)
    )
    (Node 7
      (Node 6 Leaf Leaf)
      (Node 9 Leaf Leaf)
    )

dummyTree1Reversed :: BinaryTree Int
dummyTree1Reversed =
  Node 4
    (Node 7
      (Node 9 Leaf Leaf)
      (Node 6 Leaf Leaf)
    )
    (Node 2
      (Node 3 Leaf Leaf)
      (Node 1 Leaf Leaf)
    )

dummyTree2 :: BinaryTree Int
dummyTree2 = Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)

dummyTree2Reversed :: BinaryTree Int
dummyTree2Reversed = Node 2 (Node 3 Leaf Leaf) (Node 1 Leaf Leaf)
