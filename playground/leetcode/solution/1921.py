"""
https://leetcode.com/problems/eliminate-maximum-number-of-monsters/
"""
from math import ceil

class Solution:
    def eliminateMaximum(self, dist: List[int], speed: List[int]) -> int:
        n = len(dist)
        arrival_time = [0] * n
        for i in range(n):
            arrival_time[i] = int(ceil(dist[i] / speed[i]))
        arrival_time = sorted(arrival_time)
        for t, at in enumerate(arrival_time):
            if t >= at:
                return t
        return n
