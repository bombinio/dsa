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


# Algorithm : array [2,3,4,5,18,17,6]
# We can easily calculate 'area of rectangle' by this formula and using 2 pointers: 
# 1) Declare 2 pointers, i = 0 and j = len(arr) - 1 and Move pointers until i < j
# 2) Calculate 'step' or 'vertex' of rectangle by comparing array[i] with array[j]
# 3) After comparing, find the smallest one -> this is vertex, and find area of this rectangle
# 4) Area is 'vertex' * length of rectangle => 'vertex' * (j - i)
# 5) Which pointer to move? If array[i] is less than array[j] move pointer i forward, otherwise move 'j' pointer
# 6) For each [i:j] pair we calculate MAXIMUM area at this moment (their snapshot) for example for our array, we have
# [2.....6] area is 1) minimum of array[0] and array[6] = 2(vertex), length is '6(j) - 0(i)' = 0(length) => 2 * 6 = 12
# area is 12, and AREA CAN'T BE MORE AND WON'T BE MORE ANYMORE(for example we move last pointer, now length is 5, and
# area is 10 and so on, there is no point to check area for these pointers, so we should move forward),
# that's why we move smallest pointer, we want to find area with bigger vertex.

class Solution(object):
    def maxArea(self, height):
        i = 0
        j = len(height) - 1
        tmpScore = 0
        score = 0
        while i < j:
            step = 0
            if height[i] < height[j]:
                step = height[i]
            else:
                step = height[j]
            tmpLength = j - i
            tmpScore = tmpLength * step
            print(tmpScore)
            if tmpScore > score:
                score = tmpScore
            if height[i] < height[j]:
                i += 1
            else:
                j -= 1

        return score


sol = Solution()
start = time.time()
print(sol.maxArea([2,3,4,5,18,17,6]))
print(time.time() - start)
