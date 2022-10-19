module LC1Spec (spec) where

import Test.Hspec (Spec, it)
import TestUtils (runTests2)

import qualified Problems.LC1.TamCarreOn2

spec :: Spec
spec = it "LC1" $ runTests2 implementations cases

implementations :: [[Int] -> Int -> (Int, Int)]
implementations =
    [ Problems.LC1.TamCarreOn2.twoSum
    ]

cases :: [([Int], Int, (Int, Int) -> Bool)]
cases =
    [ ([2, 7, 11, 15], 9, (==) (0, 1))
    , ([3, 2, 4], 6, (==) (1, 2))
    , ([3,3], 6, (==) (0,1))
    ]
