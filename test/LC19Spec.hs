module LC19Spec (spec) where

import Test.Hspec (Spec)
import TestUtils (runTests2)

import Problems.LinkedList (Linked (..))
import qualified Problems.LC19.TamCarreNaive

spec :: Spec
spec = runTests2 implementations cases

implementations :: [Int -> Linked a -> Linked a]
implementations =
  [ Problems.LC19.TamCarreNaive.removeNthFromEnd
  ]

fromList :: [a] -> Linked a
fromList = foldr Cons End

cases :: [(Int, Linked Int, Linked Int -> Bool)]
cases =
  [ (2, fromList [1,2,3,4,5], (==) $ fromList [1,2,3,5])
  , (1, fromList [1], (==) $ fromList [])
  , (1, fromList [1,2], (==) $ fromList [1])
  ]

