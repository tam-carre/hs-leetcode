{-# LANGUAGE OverloadedRecordDot #-}

module LC1358.TamCarre (abcSubstrings) where

import Data.Map (Map)
import qualified Data.Map as Map

abcSubstrings :: String -> Int
abcSubstrings input' = abcSubstrings' input' $ initialWindow input'

data SlidingWindow = SW
    { validSubstrs :: Int
    , frontPos     :: Int
    , counts       :: Map Char Int
    , input        :: String
    }

initialWindow :: String -> SlidingWindow
initialWindow = SW 0 0 $ Map.fromList [('a', 0), ('b', 0), ('c', 0)]

abcSubstrings' :: String -> SlidingWindow -> Int
abcSubstrings' ""     = validSubstrs
abcSubstrings' (c:cs) = abcSubstrings' cs . while valid (pushFront cs) . incr c

-- | Here's what it means to "push the front":
-- [1] Advance front position by one
-- [2] Decrement the count of the character we just removed
-- [3] Increment the valid substr count by `length unknownChars + 1`. Why?
--     Because if "abc***" is valid then "abc**", "abc*", "abc" are also valid
pushFront :: String -> SlidingWindow -> SlidingWindow
pushFront unknownChars sw = sw
    { frontPos     = sw.frontPos + 1
    , counts       = Map.adjust (subtract 1) (sw.input !! sw.frontPos) sw.counts
    , validSubstrs = sw.validSubstrs + length unknownChars + 1
    }

incr :: Char -> SlidingWindow -> SlidingWindow
incr char sw = sw { counts = Map.adjust (+1) char sw.counts }

valid :: SlidingWindow -> Bool
valid sw = all (\char -> Map.findWithDefault 0 char sw.counts > 0) "abc"

while :: (a -> Bool) -> (a -> a) -> a -> a
while p = until (not . p)
