#!/bin/python3

import os

def solve(s, n):
    l = len(s)
    a = n // l
    b = n % l
    x = s.count('a')
    y = s[:b].count('a')
    return a * x + y

if __name__ == '__main__':
    s = input()
    n = int(input())

    result = solve(s, n)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
