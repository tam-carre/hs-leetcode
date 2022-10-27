# hs-leetcode

Leetcode problems solved in Haskell.

Solutions aim to use Haskell's expressive power to be more elegant,
understandable and terse than other languages'.

Take for example "238. Product of Array Except Self (O(n))":

```hs
productExceptSelf :: [Int] -> [Int]
productExceptSelf xs = zipWith (*) productsLeftOfX productsRightOfX where
  productsLeftOfX  = init $ scanl (*) 1 xs
  productsRightOfX = tail $ scanr (*) 1 xs
```

Compare with the most voted solution:

```java
public class Solution {
public int[] productExceptSelf(int[] nums) {
    int n = nums.length;
    int[] res = new int[n];
    res[0] = 1;
    for (int i = 1; i < n; i++) {
        res[i] = res[i - 1] * nums[i - 1];
    }
    int right = 1;
    for (int i = n - 1; i >= 0; i--) {
        res[i] *= right;
        right *= nums[i];
    }
    return res;
}
}
```

## TODO

- Use template haskell(?) for less boilerplate when adding a question/solution?
- Add GitHub Actions CI pipeline
- Add example of commit adding a solution for an existing problem
- Add example of commit adding a solution for a new problem
- Add static site generator?
- Make unit tests output what test went wrong?
