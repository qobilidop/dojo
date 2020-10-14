#!/bin/python3

import os

def solve(s1, s2):
    if set(s1).isdisjoint(set(s2)):
        return "NO"
    return "YES"

if __name__ == '__main__':
    q = int(input())
    for q_itr in range(q):
        s1 = input()
        s2 = input()

        result = solve(s1, s2)

        with open(os.environ['OUTPUT_PATH'], 'a') as f:
            f.write(f'{result}\n')
