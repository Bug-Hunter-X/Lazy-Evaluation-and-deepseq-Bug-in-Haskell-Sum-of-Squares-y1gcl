# Haskell Lazy Evaluation and deepseq Bug

This repository demonstrates a subtle bug in Haskell related to lazy evaluation and the use of `Control.DeepSeq`'s `deepseq` function.  The example involves calculating the sum of squares of a large list.

## Bug Description
The provided Haskell code calculates the sum of squares of a list of numbers.  While the initial `print` statement works correctly, using `deepseq` to force evaluation before a subsequent computation or printing can lead to stack overflow exceptions or incorrect behavior. This is because the intermediate results of the `map` operation aren't fully evaluated until `deepseq` attempts to force their evaluation.

## How to Reproduce
1.  Clone this repository.
2.  Compile and run the `bug.hs` file.
3.  Observe that the first `print` statement produces the correct sum, but the second `print` statement with `deepseq` might crash or exhibit unexpected behavior for large input lists.

## Solution
The `bugSolution.hs` file provides a corrected version. The solution involves ensuring that the intermediate result of the `map` operation is fully evaluated *before* using `deepseq` to prevent this issue.