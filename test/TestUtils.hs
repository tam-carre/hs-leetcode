module TestUtils (runTests, runTests2) where

import Test.Hspec (Expectation, shouldBe)
import Data.Foldable (traverse_)

runTests :: [input -> out] -> [(input, out -> Bool)] -> Expectation
runTests implementations cases =
    traverse_
        (\(implementation, input, isValid) ->
            isValid (implementation input) `shouldBe` True
        )
        tests
  where
    tests = do
        fn <- implementations
        (input, isValid) <- cases
        [(fn, input, isValid)]

-- | TODO: Make this DRY with `runTests` somehow
runTests2 :: [input -> input2 -> out] -> [(input, input2, out -> Bool)] -> Expectation
runTests2 implementations cases =
    traverse_
        (\(implementation, input, input2, isValid) ->
          isValid (implementation input input2) `shouldBe` True
        )
        tests
  where
    tests = do
        fn <- implementations
        (input, input2, isValid) <- cases
        [(fn, input, input2, isValid)]
