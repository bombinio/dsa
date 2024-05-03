# Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.
#
#
#
# Example 1:
#
# Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
# Output: 6
# Explanation: [1,1,1,0,0,1,1,1,1,1,1]
# Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.


class Solution:
    def longestOnes(self, nums, k):
        l = 0
        r = 0
        zeros = 0
        length = 0
        while l < len(nums) and r < len(nums):
            tmpLength = r - l
            if tmpLength > length:
                length = tmpLength
            if nums[r] == 0:
                zeros += 1
            while zeros > k and l < len(nums):
                if nums[l] == 0:
                    zeros -= 1
                l += 1
            r += 1

        if r-l > length:
            length = r - l

        return length


sol = Solution()
print(sol.longestOnes([0,0,0,1], 4))