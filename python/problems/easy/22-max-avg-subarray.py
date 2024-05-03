# You are given an integer array nums consisting of n elements, and an integer k.
#
# Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.
#
#
#
# Example 1:
#
# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75


class Solution(object):
    def findMaxAverage(self, nums, k):
        sum = 0
        if len(nums) < k:
            for i in range(len(nums)):
                sum += nums[i]

            return sum / len(nums)

        l = 0
        r = k - 1
        for i in range(k):
            sum += nums[i]

        result = sum / k
        tmpSum = sum

        while r < len(nums) - 1:
            tmpSum -= nums[l]
            tmpSum += nums[r + 1]
            l += 1
            r += 1
            if tmpSum > sum:
                sum = tmpSum
                result = sum / k

        return result


sol = Solution()
print(sol.findMaxAverage([0,0,3,2,4], 5))