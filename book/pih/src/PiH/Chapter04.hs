module PiH.Chapter04 where

-- Exercise 1
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- Exercise 2
thirdA :: [a] -> a
thirdA xs = head (tail (tail xs))

thirdB :: [a] -> a
thirdB xs = xs !! 2

thirdC :: [a] -> a
thirdC (_:_:x:_) = x

-- Exercise 3
safetailA :: Show a => [a] -> [a]
safetailA xs = if (null xs) then [] else tail xs

safetailB :: [a] -> [a]
safetailB xs | null xs   = []
             | otherwise = tail xs

safetailC :: [a] -> [a]
safetailC [] = []
safetailC (_:xs) = xs

-- Exercise 4
or1 :: Bool -> Bool -> Bool
True `or1` True   = True
True `or1` False  = True
False `or1` True  = True
False `or1` False = False

or2 :: Bool -> Bool -> Bool
False `or2` False = False
_     `or2` _     = True

or3 :: Bool -> Bool -> Bool
True `or3` _  = True
False `or3` b = b

or4 :: Bool -> Bool -> Bool
b `or4` c | b == c    = b
          | otherwise = True

-- Exercise 5
and1 :: Bool -> Bool -> Bool
a `and1` b =
    if a == True then
        if b == True then
            True
        else
            False
    else
        False

-- Exercise 6
and2 :: Bool -> Bool -> Bool
a `and2` b =
    if a == True then
        b
    else
        False

-- Exercise 7
mult :: Int -> Int -> Int -> Int
mult = \x y z -> x*y*z

-- Exercise 8
luhnDouble :: Int -> Int
luhnDouble x | 2*x < 9   = 2*x
             | otherwise = 2*x - 9

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0
