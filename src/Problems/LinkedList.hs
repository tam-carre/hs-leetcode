module Problems.LinkedList (Linked (..)) where

data Linked a
  = Cons a (Linked a)
  | End
  deriving (Eq, Show)
