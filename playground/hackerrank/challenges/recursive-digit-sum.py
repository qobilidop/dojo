#!/bin/python3

import os

import functools

def solve(n, k):
    return recurse(sum(map(int, n)) * k)

@functools.lru_cache(maxsize=None)
def recurse(n):
    if n < 10:
        return n
    digit_sum = 0
    while n > 0:
        digit_sum += n % 10
        n //= 10
    return recurse(digit_sum)

if __name__ == '__main__':
    nk = input().strip().split()
    n = nk[0]
    k = int(nk[1])

    result = solve(n, k)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
