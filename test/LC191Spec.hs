module LC191Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests)

import qualified Problems.LC191.TamCarre
import qualified Problems.LC191.TamCarreNoPopCount

spec :: Spec
spec = runTests implementations cases

implementations :: [Int -> Int]
implementations =
  [ Problems.LC191.TamCarre.hammingWeight
  , Problems.LC191.TamCarreNoPopCount.hammingWeight
  ]

cases :: [(Int, Int -> Bool)]
cases =
  [ (11, (==) 3)
  , (128, (==) 1)
  , (4294967293, (==) 31)
  ]
