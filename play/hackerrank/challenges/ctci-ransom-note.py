#!/bin/python3

import os

from collections import Counter

def solve(magazine, note):
    cnt_maga = Counter(magazine)
    cnt_note = Counter(note)
    for w, c in cnt_note.items():
        if c > cnt_maga[w]:
            return "No"
    return "Yes"

if __name__ == '__main__':
    m, n = map(int, input().strip().split())
    magazine = input().strip().split()
    note = input().strip().split()

    result = solve(magazine, note)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
