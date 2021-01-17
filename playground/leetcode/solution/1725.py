"""
https://leetcode.com/problems/number-of-rectangles-that-can-form-the-largest-square/
"""
class Solution:
    def countGoodRectangles(self, rectangles):
        square_sides = list(map(min, rectangles))
        max_side = max(square_sides)
        return square_sides.count(max_side)
