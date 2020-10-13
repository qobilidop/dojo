#!/bin/python3

import os

def solve(n, queries):
    arr = [0] * (n + 1)
    for a, b, k in queries:
        arr[a - 1] += k
        arr[b] -= k
    val_max, val_cur = 0, 0
    for dv in arr:
        val_cur += dv
        val_max = max(val_max, val_cur)
    return val_max

if __name__ == '__main__':
    n, m = map(int, input().strip().split())
    queries = []
    for _ in range(m):
        queries.append(list(map(int, input().strip().split())))

    result = solve(n, queries)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
