"""
https://leetcode.com/problems/minimum-operations-to-make-a-subsequence/
"""
import bisect

class Solution:
    def minOperations(self, target, arr):
        index = {x: i for i, x in enumerate(target)}

        # LIS
        stack = []
        for x in arr:
            if x not in index:
                continue
            i = bisect.bisect_left(stack, index[x])
            if i == len(stack):
                stack.append(None)
            stack[i] = index[x]

        return len(target) - len(stack)
