"""
https://leetcode.com/problems/largest-submatrix-with-rearrangements/
"""
class Solution:
    def largestSubmatrix(self, matrix: List[List[int]]) -> int:
        m, n = len(matrix), len(matrix[0])
        max_area = 0
        for i in range(m):
            for j in range(n):
                if i > 0 and matrix[i][j] != 0:
                    matrix[i][j] += matrix[i - 1][j]

            row = sorted(matrix[i], reverse=True)
            for j, h in enumerate(row):
                w = j + 1
                max_area = max(max_area, w * h)
        return max_area
