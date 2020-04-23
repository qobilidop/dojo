-- 1
['a', 'b', 'c'] :: [Char]

('a', 'b', 'c') :: (Char, Char, Char)

[(False, '1'), (True, '1')] :: [(Bool, Char)]

([False, True], ['0', '1']) :: ([Bool], [Char])

[tail, init, reverse] :: [[a] -> [a]]

-- 2
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

-- 3
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, a) -> (a, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Num a => a -> a
double x = x * 2

palindrome :: [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- 4 done

-- 5 todo
