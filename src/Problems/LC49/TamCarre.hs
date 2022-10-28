module Problems.LC49.TamCarre (groupAnagrams) where
  
import Data.Function (on)
import Data.List (groupBy, sortBy, sort)

groupAnagrams :: [String] -> [[String]]
groupAnagrams = map unpair . groupPairsByAnagrams . map pairWithSortedVersion
  where
  pairWithSortedVersion word = (word, sort word)
  groupPairsByAnagrams = groupBy ((==) `on` snd) . sortBy (compare `on` snd)
  unpair = map fst
