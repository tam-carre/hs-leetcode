module Problems.LC238.TamCarre (productExceptSelf) where

-- | O(n)
-- The Haskell implementation of this algorithm is far more elegant and
-- understandable than other languages, provided you know what scanr, scanl,
-- tail and init do (which you should!).
-- To handle [] input, use the Data.List.NonEmpty version of those functions.
productExceptSelf :: [Int] -> [Int]
productExceptSelf xs = zipWith (*) productsLeftOfX productsRightOfX where
  productsLeftOfX  = init $ scanl (*) 1 xs
  productsRightOfX = tail $ scanr (*) 1 xs
