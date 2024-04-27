# You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
#
# Find two lines that together with the x-axis form a container, such that the container contains the most water.
#
# Return the maximum amount of water a container can store.
#
# Notice that you may not slant the container.
import time
from functools import reduce



# Input: height = [1,8,6,2,5,4,8,3,7]
# Output: 49
# Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

# Works, but very slow(Time limit exceeded)
# Future idea of Algorithm
# calculate container beetwen i and j, and from i to the start, in theory it can be in done in O(n)!
# but this is for today
class Solution(object):
    def maxArea(self, height):
        result = 0
        for i in range(len(height)):
            for j in range(i + 1, len(height)):
                if height[i] > height[j]:
                    step = height[j]
                else:
                    step = height[i]
                sumContainer = step * (j-i)
                if sumContainer > result:
                    result = sumContainer

        return result


sol = Solution()
start = time.time()
print(sol.maxArea([2,3,4,5,18,17,6]))
print(time.time() - start)
