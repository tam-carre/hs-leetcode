module Problems.LC3.TamCarrePythonTranslation (lengthOfLongestSubstring) where

import Data.Maybe (fromMaybe)
import Data.Map (member, insert, (!?))
import qualified Data.Map as Map

(??) :: Maybe c -> c -> c
(??) = flip fromMaybe

-- | Low effort 1:1 translation of
-- https://leetcode.com/problems/longest-substring-without-repeating-characters/solutions/1731/a-python-solution-85ms-o-n/
-- TODO: Write an idiomatic Haskell solution
-- However, this is a good example of how to translate closely an iterative
-- algorithm to a recursive one
lengthOfLongestSubstring :: String -> Int
lengthOfLongestSubstring s =
  loop (Map.empty, 0, 0) [0..length s - 1] where
    loop (usedChar, start, maxLength) (i:is) =
      let newUsedChar = insert (s!!i) i usedChar in
      if (s!!i) `member` usedChar && start <= usedChar !? (s!!i) ?? 0 then
        loop (newUsedChar, (usedChar !? (s!!i) ?? 0) + 1, maxLength) is

      else
        loop (newUsedChar, start, max maxLength (i - start + 1)) is

    loop (_, _, maxLength) [] = maxLength
