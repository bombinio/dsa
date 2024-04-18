# Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
#
# You must write an algorithm with O(log n) runtime complexity.
#
# Example 1:
#
# Input: nums = [-1,0,3,5,9,12], target = 9
# Output: 4
# Explanation: 9 exists in nums and its index is 4

# not working with numbers that not present in array
class Solution(object):
    def search(self, nums, target, s=0, e=6):
        mid = (s + e) // 2
        if target == nums[mid]:
            return mid
        elif target < mid:
            return self.search(nums, target, 0, mid)
        else:
            return self.search(nums, target, mid, len(nums))



sol = Solution()
print(sol.search([-1,0,3,5,9,12], 9))