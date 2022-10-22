module Problems.LC121.TamCarre (maxProfit) where

-- | O(n)
maxProfit :: [Int] -> Int
maxProfit prices = loop prices (head prices, 0) where
  loop []     (_,        profit) = profit
  loop (x:xs) (buyPrice, profit) =
    let buyPrice' = min buyPrice x
        profit'   = max profit   (x - buyPrice')
     in loop xs (buyPrice', profit')
