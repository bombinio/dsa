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

        l = output = 0

        while l < len(nums) and nums[l] >= k:
            l += 1

        if l == len(nums):
            return 0

        product = 1
        r = l
        while l < len(nums) and r < len(nums):
            product *= nums[r]
            if product >= k:
                while product >= k:
                    product /= nums[l]
                    l += 1

            output += (r - l + 1)
            r += 1

        return output


sol = Solution()
print(sol.numSubarrayProductLessThanK([100,2,3,4,100,5,6,7,100], 100))