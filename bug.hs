This Haskell code suffers from a subtle bug related to lazy evaluation and the interaction between `seq` and `deepseq`. Consider the following function that calculates the sum of squares:

```haskell
import Control.DeepSeq

sumOfSquares :: [Int] -> Int
sumOfSquares xs = sum $ map (^2) xs

main :: IO ()
main = do
  let result = sumOfSquares [1..1000000]
  print result -- This will print the correct sum
  print $ deepseq result result -- This might crash or hang
```

The `deepseq` function forces the evaluation of `result`, but due to laziness, the intermediate `map` operation might not be fully evaluated.  If a large list is used, this can lead to a stack overflow or a significant performance issue. The problem is particularly pronounced if `result` is used in subsequent calculations that depend on fully evaluated intermediate data structures.

