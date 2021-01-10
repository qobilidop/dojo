"""
https://leetcode.com/problems/decode-xored-array/
"""
class Solution:
    def decode(self, encoded, first):
        arr = [first]
        for xored in encoded:
            arr.append(arr[-1] ^ xored)
        return arr
