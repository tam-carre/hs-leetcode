module Problems.LC3.TamCarreJsTranslation (lengthOfLongestSubstring) where

import qualified Data.Set as Set

-- | Low effort 1:1 translation of
-- <https://leetcode.com/problems/longest-substring-without-repeating-characters/solutions/2694302/js-98-sliding-window-with-exlanation/>
lengthOfLongestSubstring :: String -> Int
lengthOfLongestSubstring s =
  loop (Set.empty, 0, 0) [0..length s - 1] where
    loop (set, left, maxSize) (i:is) =
      let
      (newSet, newLeft) =
        while (\(set', _) -> Set.member (s!!i) set')
          (\(set', left') -> (Set.delete (s !! left') set', left' + 1))
          (set, left)
      in
      loop (Set.insert (s!!i) newSet, newLeft, max maxSize (i - newLeft + 1)) is

    loop (_, _, maxSize) [] = maxSize

while :: (a -> Bool) -> (a -> a) -> a -> a
while p = until (not . p)
