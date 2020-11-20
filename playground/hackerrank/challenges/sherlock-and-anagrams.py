#!/bin/python3

import os

from collections import Counter

def solve(s):
    n_pairs = 0
    n = len(s)
    for l in range(1, n):
        cnt = Counter()
        for i in range(n - l + 1):
            key = ''.join(sorted(s[i:i + l]))
            cnt[key] += 1
        for c in cnt.values():
            n_pairs += c * (c - 1) // 2
    return n_pairs

if __name__ == '__main__':
    q = int(input())
    for _ in range(q):
        s = input()

        result = solve(s)

        with open(os.environ['OUTPUT_PATH'], 'a') as f:
            f.write(f'{result}\n')
