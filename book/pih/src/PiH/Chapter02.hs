module PiH.Chapter02 where

-- Exercise 1
-- skip

-- Exercise 2
-- skip

-- Exercise 3
n = a `div` length xs
  where
    a = 10
    xs = [1, 2, 3, 4, 5]

-- Exercise 4
last1 xs = head (reverse xs)
last2 xs = xs !! (length xs - 1)

-- Exercise 5
init1 xs = reverse (tail (reverse xs))
init2 xs = take (length xs - 1) xs
