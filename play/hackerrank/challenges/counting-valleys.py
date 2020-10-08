#!/bin/python3

import os

def solve(path):
    n_valley = 0
    altitude = 0
    for step in path:
        if step == 'D':
            altitude -= 1
        elif step == 'U':
            altitude += 1
            if altitude == 0:
                n_valley += 1
    return n_valley

if __name__ == '__main__':
    steps = int(input().strip())
    path = input()

    result = solve(path)

    with open(os.environ['OUTPUT_PATH'], 'w') as f:
        f.write(f'{result}\n')
