module Problems.LC217.TamCarre (containsDuplicate) where

import Data.List (nub)

containsDuplicate :: (Eq a) => [a] -> Bool
containsDuplicate list = length list /= length (nub list)
