-- 1 skip

-- 2 skip

-- 3
n = a `div` length xs
    where
        a = 10
        xs = [1, 2, 3, 4, 5]

-- 4
last1 xs = head (reverse xs)
last2 xs = xs !! (length xs - 1)

-- 5
init1 xs = reverse (tail (reverse xs))
init2 xs = take (length xs - 1) xs
