```haskell
import Control.DeepSeq

sumOfSquares :: [Int] -> Int
sumOfSquares xs = let
                    intermediate = map (^2) xs
                    evaluated_intermediate = rdeepseq intermediate intermediate
                    in sum evaluated_intermediate 

main :: IO ()
main = do
  let result = sumOfSquares [1..1000000]
  print result
  print $ deepseq result result
```

This revised code uses `rdeepseq` from the `Control.DeepSeq` package to ensure complete evaluation of the `map` results before summing them up. This avoids the lazy evaluation issue and prevents the potential stack overflow.
