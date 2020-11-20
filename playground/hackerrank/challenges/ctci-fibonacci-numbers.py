#!/bin/python3

import os

import functools

@functools.lru_cache(maxsize=None)
def solve(n):
    if n < 2:
        return n
    return solve(n - 1) + solve(n - 2)

if __name__ == '__main__':
    n = int(input())

    result = solve(n)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
