"""
https://leetcode.com/problems/cat-and-mouse-ii/
"""
from functools import lru_cache

DIRS = [
    (0, 1),
    (0, -1),
    (1, 0),
    (-1, 0),
]

class Solution:
    def canMouseWin(self, grid: List[str], catJump: int, mouseJump: int) -> bool:
        m, n = len(grid), len(grid[0])
        catPos, mousePos = None, None
        for i in range(m):
            for j in range(n):
                if grid[i][j] == 'C':
                    catPos = (i, j)
                elif grid[i][j] == 'M':
                    mousePos = (i, j)

        def gridAt(pos):
            i, j = pos
            return grid[i][j]

        def move(pos, maxJump):
            yield pos
            i, j = pos
            for di, dj in DIRS:
                for jump in range(1, maxJump + 1):
                    iNext = i + di * jump
                    jNext = j + dj * jump
                    if iNext < 0 or iNext >= m:
                        break
                    if jNext < 0 or jNext >= n:
                        break
                    if grid[iNext][jNext] == '#':
                        break
                    yield (iNext, jNext)

        @lru_cache(None)
        def mouseCanWin(turn, catPos, mousePos):
            if catPos == mousePos:
                # Cat occupies the same position as Mouse, Cat wins.
                return False
            if gridAt(catPos) == 'F':
                # Cat reaches the food first, Cat wins.
                return False
            if gridAt(mousePos) == 'F':
                # Mouse reaches the food first, Mouse wins.
                return True
            if turn > 2 * m * n:
                # Mouse cannot get to the food within 1000 turns, Cat wins.
                return False

            if turn % 2 == 1:
                # Mouse moves
                for mousePosNext in move(mousePos, mouseJump):
                    if mouseCanWin(turn + 1, catPos, mousePosNext):
                        return True
                return False
            else:
                # Cat moves
                for catPosNext in move(catPos, catJump):
                    if not mouseCanWin(turn + 1, catPosNext, mousePos):
                        return False
                return True

        return mouseCanWin(1, catPos, mousePos)
