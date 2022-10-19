module LC125Spec (spec) where

import Test.Hspec (Spec, it)
import TestUtils (runTests)

import qualified Problems.LC125.TamCarre

spec :: Spec
spec = it "LC1" $ runTests implementations cases

implementations :: [String -> Bool]
implementations =
  [ Problems.LC125.TamCarre.isPalindrome
  ]

cases :: [(String, Bool -> Bool)]
cases =
  [ ("A man, a plan, a canal: Panama", (==) True)
  , ("race a car", (==) False)
  , (" ", (==) True)
  , ("0P", (==) False)
  ]
