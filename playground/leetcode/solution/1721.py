"""
https://leetcode.com/problems/swapping-nodes-in-a-linked-list/
"""
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

def swap(handle1,  handle2):
    if handle1.next.val == handle2.next.val:
        return

    handle1.next, handle2.next = handle2.next, handle1.next
    handle1.next.next, handle2.next.next = handle2.next.next, handle1.next.next

class Solution:
    def swapNodes(self, head, k):
        handle_head = ListNode()
        handle_head.next = head

        handle1 = handle_head
        for _ in range(k - 1):
            handle1 = handle1.next

        handle2 = handle_head
        handle_tail = handle1
        while handle_tail.next.next is not None:
            handle2 = handle2.next
            handle_tail = handle_tail.next

        swap(handle1, handle2)
        return handle_head.next
