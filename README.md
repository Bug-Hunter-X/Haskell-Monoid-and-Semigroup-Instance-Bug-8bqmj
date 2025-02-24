# Haskell Monoid and Semigroup Instance Bug

This repository contains a Haskell program that demonstrates a subtle bug related to the interaction between `Monoid` and `Semigroup` instances for custom data types.  The program defines instances for lists and a custom `Tree` data structure. The bug lies in the implementation of the `mappend` function for the `Tree` instance.

## Bug Description

The `mappend` function for the `Tree` type incorrectly handles the case where one of the input trees is `Leaf`. The current implementation only handles cases where both trees are `Node`. This leads to unexpected results when combining trees, especially when using `mempty`.

## Solution

The solution is included in the `bugSolution.hs` file.  The corrected `mappend` function now correctly handles the case of `Leaf` as an argument, making the `Monoid` instance fully correct.

## How to Run

1.  Ensure you have a Haskell compiler (like GHC) installed.
2.  Clone this repository.
3.  Compile and run the code using GHCi:
   ```bash
   ghci bug.hs
   ghci bugSolution.hs
   ```

Observe the different outputs between the original buggy code and the corrected solution.