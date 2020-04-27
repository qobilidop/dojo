-- 1
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- 2
third_a :: [a] -> a
third_a xs = head (tail (tail xs))

third_b :: [a] -> a
third_b xs = xs !! 2

third_c :: [a] -> a
third_c (_:_:x:_) = x

-- 3
safetail_a :: [a] -> [a]
safetail_a xs = if null xs then [] else tail xs

safetail_b :: [a] -> [a]
safetail_b xs | null xs   = []
              | otherwise = tail xs

safetail_c :: [a] -> [a]
safetail_c [] = []
safetail_c (_:xs) = xs

-- 4
(||) :: Bool -> Bool -> Bool
True || True   = True
True || False  = True
False || True  = True
False || False = False

(||.) :: Bool -> Bool -> Bool
False ||. False = False
_     ||. _     = True

(||..) :: Bool -> Bool -> Bool
True ||.. _  = True
False ||.. b = b

(||...) :: Bool -> Bool -> Bool
b ||... c | b == c    = b
          | otherwise = True

-- 5
(&&) :: Bool -> Bool -> Bool
a && b =
    if a == True then
        if b == True then
            True
        else
            False
    else
        False

-- 6
(&&.) :: Bool -> Bool -> Bool
a &&. b =
    if a == True then
        b
    else
        False

-- 7
mult :: Int -> Int -> Int -> Int
mult = \x y z -> x*y*z

-- 8
luhnDouble :: Int -> Int
luhnDouble x | 2*x < 9   = 2*x
             | otherwise = 2*x - 9

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0
