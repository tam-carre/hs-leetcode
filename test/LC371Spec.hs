module LC371Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests2)

import qualified Problems.LC371.TamCarre

spec :: Spec
spec = runTests2 implementations cases

implementations :: [Int -> Int -> Int]
implementations =
  [ Problems.LC371.TamCarre.getSum
  ]

cases :: [(Int, Int, Int -> Bool)]
cases =
  [ (1, 2, (==) 3)
  , (2, 5, (==) 7)
  , (999, -100, (==) 899)
  ]
