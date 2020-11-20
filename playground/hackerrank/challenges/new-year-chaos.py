#!/bin/python3

import os

def solve(q):
    n_bribes = 0
    p = [x - 1 for x in q]
    for i, x in enumerate(p):
        if x - i > 2:
            return "Too chaotic"
        for j in range(max(x - 1, 0), i):
            if q[j] > q[i]:
                n_bribes += 1
    return n_bribes

if __name__ == '__main__':
    t = int(input())
    for _ in range(t):
        n = int(input())
        q = list(map(int, input().strip().split()))

        result = solve(q)

        with open(os.environ['OUTPUT_PATH'], 'a') as f:
            f.write(f'{result}\n')
