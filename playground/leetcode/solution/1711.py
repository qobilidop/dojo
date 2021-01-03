"""
https://leetcode.com/problems/count-good-meals/
"""
from math import ceil, log2

class Solution:
    def countPairs(self, deliciousness):
        n_good = 0

        p_max = int(ceil(log2(max(deliciousness))) + 1)
        targets = [1 << p for p in range(p_max + 1)]
        counter = Counter()
        for x in deliciousness:
            for target in targets:
                y = target - x
                if y in counter:
                    n_good += counter[y]
            counter[x] += 1

        n_good = n_good % int(10**9 + 7)
        return n_good
