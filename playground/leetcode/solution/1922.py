"""
https://leetcode.com/problems/count-good-numbers/
"""
def mod(n):
    return n % int(1e9 + 7)

def power(base, exp):
    ans = 1
    while exp:
        if exp & 1:
            ans = mod(ans * base)
        exp >>= 1
        base = mod(base * base)
    return ans

class Solution:
    def countGoodNumbers(self, n: int) -> int:
        d_even = 5
        d_prime = 4

        n_pair = n // 2
        extra = n % 2

        ans = power(d_even * d_prime, n_pair)
        if extra:
            ans = mod(ans * d_even)

        return ans
