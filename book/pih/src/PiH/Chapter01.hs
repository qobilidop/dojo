module PiH.Chapter01 where

import Prelude hiding (product)

-- Exercise 1
{-
  double (double 2)
=    { applying the outer double }
  (double 2) + (double 2)
=    { applying double }
  (2 + 2) + (2 + 2)
=    { applying + }
  4 + 4
=    { applying + }
  8
-}

-- Exercise 2
{-
  sum [x]
= sum (x:[])
= x + sum []
= x + 0
= x
-}

-- Exercise 3
product :: Num a => [a] -> a
product []     = 1
product (n:ns) = n * product ns

-- Exercise 4
qsortReverse [] = []
qsortReverse (x:xs) =
    qsortReverse larger ++ [x] ++ qsortReverse smaller
  where
    smaller = [a | a <- xs, a <= x]
    larger  = [b | b <- xs, b > x]

-- Exercise 5
qsortUnique [] = []
qsortUnique (x:xs) =
    qsortUnique smaller ++ [x] ++ qsortUnique larger
  where
    smaller = [a | a <- xs, a < x]
    larger  = [b | b <- xs, b > x]
