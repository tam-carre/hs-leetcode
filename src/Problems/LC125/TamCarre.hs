module Problems.LC125.TamCarre (isPalindrome) where

import Data.Char (toLower, isAlphaNum)

isPalindrome :: String -> Bool
isPalindrome str = normalize str == reverse (normalize str)
  where normalize = filter isAlphaNum . map toLower
