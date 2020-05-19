module PiH.Chapter07 where

import Data.Char
import Prelude hiding (
  all, any, takeWhile, dropWhile,
  curry, uncurry,
  iterate
  )

-- Exercise 1
mapFilter :: (a -> b) -> (a -> Bool) -> [a] -> [b]
mapFilter f p xs = map f (filter p xs)

-- Exercise 2
all :: (a -> Bool) -> [a] -> Bool
all p xs = foldr (&&) True (map p xs)

any :: (a -> Bool) -> [a] -> Bool
any p xs = foldr (||) False (map p xs)

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs) | p x       = x : takeWhile p xs
                   | otherwise = []

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p (x:xs) | p x       = dropWhile p xs
                   | otherwise = x:xs

-- Exercise 3
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x r -> (f x):r) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x r -> if p x then x:r else r) []

-- Exercise 4
dec2int :: [Int] -> Int
dec2int = foldl (\l x -> l*10 + x) 0

-- Exercise 5
curry :: ((a, b) -> c) -> (a -> b -> c)
curry f = \a b -> f (a, b)

uncurry :: (a -> b -> c) -> ((a, b) -> c)
uncurry f = \(a, b) -> f a b

-- Exercise 6
unfold :: (a -> Bool) -> (a -> b) -> (a -> a) -> a -> [b]
unfold p h t x | p x       = []
               | otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> [[Bit]]
chop8 = unfold null (take 8) (drop 8)

map'' :: (a -> b) -> [a] -> [b]
map'' f = unfold null (f . head) tail

iterate :: (a -> a) -> a -> [a]
iterate f = unfold (\_ -> False) id f

-- Exercise 7
bin2int :: [Bit] -> Int
bin2int = foldr (\x r -> x + 2*r) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

recordParity :: [Bit] -> [Bit]
recordParity bits = bits ++ [(sum bits) `mod` 2]

verifyParity :: [Bit] -> [Bit]
verifyParity bits | parityCorrect = take (n-1) bits
                  | otherwise     = error "parity error"
  where
    n = length bits
    parityRecorded = bits !! (n-1)
    parityExpected = (sum (take (n-1) bits)) `mod` 2
    parityCorrect = parityRecorded == parityExpected

encodeChar :: Char -> [Bit]
encodeChar = recordParity . make8 . int2bin . ord

decodeChar :: [Bit] -> Char
decodeChar = chr . bin2int . verifyParity

encode :: String -> [Bit]
encode = concat . map encodeChar

decode :: [Bit] -> String
decode = map decodeChar . chop9

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

-- Exercise 8
transmitFaulty :: String -> String
transmitFaulty = decode . channelFaulty . encode

channelFaulty :: [Bit] -> [Bit]
channelFaulty = tail

-- Exercise 9
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f1 f2 xs = [f x | (f, x) <- zip fs xs]
  where
    fs = concatMap (\(a,b) -> [a,b]) (zip (repeat f1) (repeat f2))

-- Exercise 10
luhnDouble :: Int -> Int
luhnDouble x | 2*x < 9   = 2*x
             | otherwise = 2*x - 9

luhn :: [Int] -> Bool
luhn xs = sum (altMap luhnDouble id xs) `mod` 10 == 0
