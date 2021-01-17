"""
https://leetcode.com/problems/tuple-with-same-product/
"""
from collections import Counter

class Solution:
    def tupleSameProduct(self, nums):
        n = len(nums)

        prods = Counter()
        for i in range(n - 1):
            for j in range(i + 1, n):
                prods[nums[i] * nums[j]] += 1

        n_tuple_set = 0
        for n_pair in prods.values():
            n_tuple_set += n_pair * (n_pair - 1) //2
        return n_tuple_set * 8
