"""
https://leetcode.com/problems/maximum-units-on-a-truck/
"""
from collections import Counter

class Solution:
    def maximumUnits(self, box_types, truck_size):
        unit_max = 0
        truck_capacity = truck_size
        for n_box, unit in sorted(box_types, key=lambda box_unit: box_unit[1], reverse=True):
            n_box_to_put = min(n_box, truck_capacity)
            unit_max += n_box_to_put * unit
            truck_capacity -= n_box_to_put
            if truck_capacity == 0:
                break
        return unit_max
