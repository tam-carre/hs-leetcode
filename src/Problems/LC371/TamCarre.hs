module Problems.LC371.TamCarre (getSum) where

import Data.Bits ((.&.), xor, shift)

-- | Recommended explanation: https://www.youtube.com/watch?v=qq64FrA2UXQ
getSum :: Int -> Int -> Int
getSum a 0 = a
getSum a b = getSum (a `xor` b) carry
  where
  carry = (a .&. b) `shift` 1
