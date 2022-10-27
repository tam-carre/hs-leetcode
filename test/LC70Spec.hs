module LC70Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests)

import qualified Problems.LC70.TamCarre

spec :: Spec
spec = runTests implementations cases

implementations :: [Int -> Int]
implementations =
  [ Problems.LC70.TamCarre.climbStairs
  ]

cases :: [(Int, Int -> Bool)]
cases =
  [ (1, (==) 1)
  , (2, (==) 2)
  , (3, (==) 3)
  , (4, (==) 5)
  , (5, (==) 8)
  , (6, (==) 13)
  , (45, (==) 1836311903)
  ]
