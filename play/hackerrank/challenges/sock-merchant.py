#!/bin/python3

import os

from collections import Counter

def solve(ar):
    return sum(cnt // 2 for cnt in Counter(ar).values())

if __name__ == '__main__':
    n = int(input())
    ar = list(map(int, input().strip().split()))

    result = solve(ar)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
