# Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.
#
#
#
# Example 1:
#
# Input: nums = [10,5,2,6], k = 100
# Output: 8
# Explanation: The 8 subarrays that have product less than 100 are:
# [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
# Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.


# not working
class Solution(object):
    # TODO
    def numSubarrayProductLessThanK(self, nums, k):
        l = 0
        r = 0
        output = 0
        tmpProduct = nums[l]
        while l < len(nums) and nums[l] > k:
            l += 1

        while l < len(nums) and r < len(nums) - 1:

            output += r - l + 1

            while tmpProduct > k and l < len(nums):
                tmpProduct /= nums[l]
                l += 1

            r += 1

            tmpProduct *= nums[r]
            if tmpProduct < k:
                output += r - l + 1

        return output


sol = Solution()
print(sol.numSubarrayProductLessThanK([10,5,2,6], 100))