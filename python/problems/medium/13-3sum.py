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


# Algorithm:
# Sort array to use 2 pointer technic.
# create hashset for future pairs of triplets
# Now, for each iteration, we make 'fixed number' in our case its nums[i] and for range '[i+1:array.length]' we 
# firstly creating base case -> 'j<k' and secondly iterating in this range and using 2 pointers we trying to find 
# triplets. For example we got sorted array: [-4, -3, -2, 0, 4, 6, 7]. We fixed i=0(-4) and iterating in range 
# i+1:array.length, then using 2 pointers we compare sum of all 3 numbers -> -4 + nums[i+1] + nums[array.length-1]
# if sum is bigger than 0 we decrement 'tail' otherwise we increment j or i+1 to i+1 + 1 and so on.
# in our array we have nums[i] = -4, nums[i+1] = -3, nums[k] = 7 => -4 + -3 + 7 = 0. Add this triplet to hashSet
# decrement 'tail' => nums[i] = -4, nums[i+1] = -3, nums[k] = 6 => result is less than 0, increment i+1 to i+1 + 1 etc.

class Solution(object):
    def threeSum(self, nums):
        nums.sort()
        prevSet = set()
        for i in range(len(nums)):
            print(i)
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
# print(sol.threeSum([-1, 0, 1, 2, -1, -4]))
print(sol.threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]))
# print(sol.threeSum([0, 0, 0]))
