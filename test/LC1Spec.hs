module LC1Spec (spec) where

import Test.Hspec (Spec, it)
import TestUtils (runTests2)

import qualified Problems.LC1.TamCarreOn2
import qualified Problems.LC1.TamCarreOn

spec :: Spec
spec = it "LC1" $ runTests2 implementations cases

implementations :: [[Int] -> Int -> (Int, Int)]
implementations =
    [ Problems.LC1.TamCarreOn2.twoSum
    , Problems.LC1.TamCarreOn.twoSum
    ]

cases :: [([Int], Int, (Int, Int) -> Bool)]
cases =
    [ ([2, 7, 11, 15], 9, \a -> a == (0, 1) || a == (1, 0))
    , ([3, 2, 4], 6, \a -> a == (1, 2) || a == (2, 1))
    , ([3,3], 6, \a -> a == (0,1) || a == (1,0))
    ]
