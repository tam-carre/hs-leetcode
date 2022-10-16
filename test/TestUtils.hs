module TestUtils (runTests) where

import Test.Hspec (Expectation, shouldBe)
import Data.Foldable (traverse_)

runTests :: (Show expectedout, Eq expectedout) =>
    [input -> expectedout]
    -> [(input, expectedout)]
    -> Expectation
runTests implementations cases =
    traverse_
        (\(implementation, input, expectedOut) ->
            implementation input `shouldBe` expectedOut
        )
        tests
  where
    tests = do
        fn <- implementations
        (input, expectedOutput) <- cases
        [(fn, input, expectedOutput)]
