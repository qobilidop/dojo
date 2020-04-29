{-# LANGUAGE FlexibleContexts #-}
import Data.Char

-- 1
sum_square n = sum [x^2 | x <- [1..n]]

-- 2
grid :: Int -> Int -> [(Int,Int)]
grid m n = [(x,y) | x <- [0..m], y <- [0..n]]

-- 3
square :: Int -> [(Int, Int)]
square n = [(x,y) | (x,y) <- grid n n, x /= y]

-- 4
replicate' :: Int -> a -> [a]
replicate' n x = [x | _ <- [1..n]]

-- 5
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- 6
factors :: Int -> [Int]
factors n = [x | x <- [1..n-1], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], x == sum (factors x)]

-- 7
product' :: [a] -> [b] -> [(a, b)]
product' xs ys = concat [[(x,y) | y <- ys] | x <- xs]

-- 8
find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..])

-- 9
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x*y | (x,y) <- zip xs ys]

-- 10
low2int :: Char -> Int
low2int c = ord c - ord 'a'

int2low :: Int -> Char
int2low n = chr (ord 'a' + n)

upp2int :: Char -> Int
upp2int c = ord c - ord 'A'

int2upp :: Int -> Char
int2upp n = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2low ((low2int c + n) `mod` 26)
          | isUpper c = int2upp ((upp2int c + n) `mod` 26)
          | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]
