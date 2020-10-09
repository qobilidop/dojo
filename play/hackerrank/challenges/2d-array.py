#!/bin/python3

import os

def solve(arr):
    max_sum = -float('inf')
    m, n = len(arr), len(arr[0])
    for i in range(m - 2):
        for j in range(n - 2):
            max_sum = max(max_sum, hourglass_sum(arr, i, j))
    return max_sum

def hourglass_sum(arr, i, j):
    return sum(arr[i][j : j + 3]) + arr[i + 1][j + 1] + sum(arr[i + 2][j : j + 3])

if __name__ == '__main__':
    arr = []
    for _ in range(6):
        arr.append(list(map(int, input().strip().split())))

    result = solve(arr)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
