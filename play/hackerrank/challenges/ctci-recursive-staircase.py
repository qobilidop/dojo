#!/bin/python3

import os

import functools

@functools.lru_cache(maxsize=None)
def solve(n):
    if n < 0:
        return 0
    if n == 0:
        return 1
    return (solve(n - 1) + solve(n - 2) + solve(n - 3)) % (10**10 + 7)

if __name__ == '__main__':
    s = int(input())
    for _ in range(s):
        n = int(input())

        result = solve(n)

        with open(os.environ['OUTPUT_PATH'], 'a') as f:
            f.write(f'{result}\n')
