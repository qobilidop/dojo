#!/bin/python3

import os

def solve(a, d):
    return a[d:] + a[:d]

if __name__ == '__main__':
    n, d = map(int, input().strip().split())
    a = list(map(int, input().strip().split()))

    result = solve(a, d)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(' '.join(map(str, result)) + '\n')
