"""
https://leetcode.com/problems/minimize-hamming-distance-after-swap-operations/
"""
from collections import Counter

class DisjointSet:
    def __init__(self, size):
        self.parent = list(range(size))

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, x, y):
        x = self.find(x)
        y = self.find(y)
        if x == y:
            return
        self.parent[x] = y

class Solution:
    def minimumHammingDistance(self, source, target, allowed_swaps):
        n = len(source)
        index_set = DisjointSet(n)
        for a, b in allowed_swaps:
            index_set.union(a, b)

        counters = {}
        for a, (s, t) in enumerate(zip(source, target)):
            tag = index_set.find(a)
            if tag not in counters:
                counters[tag] = Counter()
            counters[tag][s] += 1
            counters[tag][t] -= 1

        dist = 0
        for counter in counters.values():
            dist += sum(map(abs, counter.values())) // 2
        return dist
