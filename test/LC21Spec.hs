module LC21Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests2)

import Problems.LinkedList (Linked (Cons, End))
import qualified Problems.LC21.TamCarre

spec :: Spec
spec = runTests2 implementations cases

implementations :: [Linked Int -> Linked Int -> Linked Int]
implementations =
  [ Problems.LC21.TamCarre.mergeTwoLists
  ]

fromList :: [a] -> Linked a
fromList = foldr Cons End

cases :: [(Linked Int, Linked Int, Linked Int -> Bool)]
cases =
  [ (fromList [1,2,4], fromList [1,3,4], (==) $ fromList [1,1,2,3,4,4])
  , (fromList [], fromList [], (==) $ fromList [])
  , (fromList [], fromList [0], (==) $ fromList [0])
  , (fromList [-30,-27,-27,-23,-23,-22,-21,-21,-19,-19,-16,-16,-15,-13,-9,-9,-5,-5,-3,-2,0,5,5,6,6,7,7,8,9,9,11,11,12,16,20,22,23,23,24,25,25,26], fromList [-25,-25,-22,-20,-18,-17,-11,-2,-2,5,9,13,21,28,28,29], (==) $ fromList [-30,-27,-27,-25,-25,-23,-23,-22,-22,-21,-21,-20,-19,-19,-18,-17,-16,-16,-15,-13,-11,-9,-9,-5,-5,-3,-2,-2,-2,0,5,5,5,6,6,7,7,8,9,9,9,11,11,12,13,16,20,21,22,23,23,24,25,25,26,28,28,29])
  ]
