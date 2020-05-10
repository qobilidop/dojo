module PiH.Chapter03 where

-- Exercise 1
chars :: [Char]
chars = ['a', 'b', 'c']

char3 :: (Char, Char, Char)
char3 = ('a', 'b', 'c')

boolchars :: [(Bool, Char)]
boolchars = [(False, '1'), (True, '1')]

boolschars :: ([Bool], [Char])
boolschars = ([False, True], ['0', '1'])

listFuncs :: [[a] -> [a]]
listFuncs = [tail, init, reverse]

-- Exercise 2
bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[0], [1, 2], [3, 4, 5]]

add :: Int -> Int -> Int -> Int
add x y z = x + y + z

copy :: a -> (a, a)
copy x = (x, x)

apply :: (a -> b) -> a -> b
apply f x = f x

-- Exercise 3
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, a) -> (a, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Num a => a -> a
double x = x * 2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- Exercise 4
-- skip

-- Exercise 5
-- skip
