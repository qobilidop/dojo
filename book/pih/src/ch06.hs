import Prelude hiding ((^), and, concat, replicate, (!!), elem, sum, take, last)

-- 1
fac :: Int -> Int
fac 0 = 1
fac n | n > 0 = n * fac (n-1)

-- 2
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n-1)

-- 3
(^) :: Int -> Int -> Int
m^0 = 1
m^n = m * m^(n-1)

-- 4
euclid :: Int -> Int -> Int
euclid x y | x == y = x
           | x < y  = euclid x (y-x)
           | x > y  = euclid (x-y) y

-- 5 skip

-- 6 a
and :: [Bool] -> Bool
and [] = True
and (x:xs) = x && (and xs)

-- 6 b
concat :: [[a]] -> [a]
concat [] = []
concat (x:xs) = x ++ (concat xs)

-- 6 c
replicate :: Int -> a -> [a]
replicate 0 x = []
replicate n x = [x] ++ (replicate (n-1) x)

-- 6 d
(!!) :: [a] -> Int -> a
(x:xs) !! 0 = x
(x:xs) !! n = xs !! (n-1)

-- 6 e
elem :: Eq a => a -> [a] -> Bool
elem x [] = False
elem x (y:ys) | x == y = True
              | x /= y = elem x ys

-- 7
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x < y     = [x] ++ merge xs (y:ys)
                    | otherwise = [y] ++ merge (x:xs) ys

-- 8
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort a) (msort b) where
    (a, b) = halve xs

-- 9 a
sum :: Num a => [a] -> a
sum [] = 0
sum (x:xs) = x + sum xs

-- 9 b
take :: Int -> [a] -> [a]
take 0 _ = []
take n (x:xs) = [x] ++ take (n-1) xs

-- 9 c
last :: [a] -> a
last (x:[]) = x
last (x:xs) = last xs
