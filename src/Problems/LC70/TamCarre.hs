module Problems.LC70.TamCarre (climbStairs) where

-- | This is a fibonacci starting with 1 and 2 instead of 0 and 1.
-- Recommended reading: https://wiki.haskell.org/The_Fibonacci_sequence
climbStairs :: Int -> Int
climbStairs n = solutions !! (n-1) where
  solutions = 1 : 2 : zipWith (+) solutions (tail solutions)
