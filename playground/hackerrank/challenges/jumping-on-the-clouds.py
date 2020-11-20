#!/bin/python3

import os

def solve(c):
    n_jump = 0
    i, n = 0, len(c)
    while i < n - 1:
        if i + 2 < n and c[i + 2] == 0:
            i += 2
        elif i + 1 < n and c[i + 1] == 0:
            i += 1
        else:
            return -1
        n_jump += 1
    return n_jump

if __name__ == '__main__':
    n = int(input())
    c = list(map(int, input().strip().split()))

    result = solve(c)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
