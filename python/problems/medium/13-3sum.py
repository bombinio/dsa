# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
#
# Notice that the solution set must not contain duplicate triplets.
#
#
#
# Example 1:
#
# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
# Explanation:
# nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
# nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
# nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
# The distinct triplets are [-1,0,1] and [-1,-1,2].
# Notice that the order of the output and the order of the triplets does not matter.


# not working
class Solution(object):
    def threeSum(self, nums):
        nums.sort()
        prevSet = set()
        for i in range(len(nums) - 2):
            j = i + 1
            k = len(nums) - 1
            while j < k:
                if nums[i] + nums[j] + nums[k] == 0:
                    prevSet.add((nums[i], nums[j], nums[k]))
                    k -= 1
                elif nums[i] + nums[j] + nums[k] > 0:
                    k -= 1
                else:
                    j += 1
        output = []
        for nset in prevSet:
            output.append(list(nset))
        return output


sol = Solution()
print(sol.threeSum([-1, 0, 1, 2, -1, -4]))
print(sol.threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]))
print(sol.threeSum([0, 0, 0]))
