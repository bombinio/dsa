# Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
#
#
#
# Example 1:
#
# Input: nums = [-4,-1,0,3,10]
# Output: [0,1,9,16,100]
# Explanation: After squaring, the array becomes [16,1,0,9,100].
# After sorting, it becomes [0,1,9,16,100].

# Algorithm 2 Pointers
# 1) Create 3 pointers, 1 for start index and second for end of array, and third for output array
# 2) compare pointers, and biggest one, add to the end of output array
# 3) we know that, '-' * '-' = '+' and the lowest number might be the highest in the array after "squaring", that's
# how this solution works, we compare first and second number without their sign, and add to the end of output array
# in this way we only add highest numbers

class Solution(object):
    def sortedSquares(self, nums):
        i = 0
        j = len(nums) - 1
        k = len(nums) - 1
        output = [0] * len(nums)
        while i <= j:
            if abs(nums[i]) > abs(nums[j]):
                output[k] = nums[i] * nums[i]
                i += 1
                k -= 1
            else:
                output[k] = nums[j] * nums[j]
                j -= 1
                k -= 1
        return output

sol = Solution()
print(sol.sortedSquares([-5,-3,-2,-1]))