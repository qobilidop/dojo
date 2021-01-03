"""
https://leetcode.com/problems/ways-to-split-array-into-three-subarrays/
"""
import bisect
from itertools import accumulate

class Solution:
    def waysToSplit(self, nums):
        n_good = 0

        n_nums = len(nums)
        cum_sum = list(accumulate(nums, initial=0))
        total_sum = cum_sum[-1]

        max_1 = total_sum / 3
        i_min = 1
        i_max = bisect.bisect_right(cum_sum, max_1) - 1
        for i in range(i_min, i_max + 1):
            min_2 = cum_sum[i] * 2
            max_2 = cum_sum[i] + (total_sum - cum_sum[i]) / 2
            j_min = max(bisect.bisect_left(cum_sum, min_2), i + 1)
            j_max = min(bisect.bisect_right(cum_sum, max_2) - 1, n_nums - 1)
            n_good += max(j_max - j_min + 1, 0)

        n_good = n_good % int(10**9 + 7)
        return n_good
