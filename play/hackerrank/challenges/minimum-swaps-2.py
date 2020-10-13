#!/bin/python3

import os

def solve(arr):
    n_swap = 0
    arr = [x - 1 for x in arr]
    i = 0
    while i < len(arr):
        if arr[i] == i:
            i += 1
            continue
        j = arr[i]
        arr[i], arr[j] = arr[j], arr[i]
        n_swap += 1
    return n_swap

if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().rstrip().split()))

    result = solve(arr)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
