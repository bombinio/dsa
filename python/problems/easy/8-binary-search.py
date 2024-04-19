# Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
#
# You must write an algorithm with O(log n) runtime complexity.
#
# Example 1:
#
# Input: nums = [-1,0,3,5,9,12], target = 9
# Output: 4
# Explanation: 9 exists in nums and its index is 4

# Algorithm
# Define start and end. Start = index 0; end = last index of array = 5, then find index of mid element and compare arr[mid]
# with target if they are equal return index of mid element, if arr[mid] > target then target in range [0...mid-1]
# otherwise in range [mid+1...end of array]. For example for number 5 it will be like this =>
# mid = (s + e) / 2 = 2; arr[2] < 5 -> 5 in range [mid+1...end]. Run func with range (2+1, end) => s = 3, end = 5 ->
# m = ( 3 + 5) / 2 = 4; arr[4] > 5 -> 5 in range [0...mid-1] or [0...4-1]. Run func with range (0, 3) => s = 0, end = 3
# mid = (0+3) / 2 = 1; arr[1] < 5 -> 5 in range [mid+1... end] but end is not length of array, but end from last call of
# this function: run func with range [mid+1 ... end] => func(2,3) -> mid = (2+3) / 2 = 2; arr[2] < 5 => 5 in range of
# [mid+1, end] => start = 3, end = 3, mid = 3 and arr[mid] = target -> Bingo we found index of target number!!!
# What if we were trying to find 4? 4 is not present in array, but we will do the same algorithm as we did for 5, but
# after comparing target with arr[mid] it will return false, then next compare of start >= end will return true and it
# will return -1, that's how to deal with numbers that not present in array
class Solution(object):
    def search(self, nums, target, s=0, e=None):
        if e is None:
            e = len(nums) - 1
        mid = (s + e) // 2
        if target == nums[mid]:
            return mid
        if s >= e:
            return -1
        elif nums[mid] > target:
            return self.search(nums, target, 0, mid-1)
        else:
            return self.search(nums, target, mid+1, e)



sol = Solution()
print(sol.search([-1,0,3,5,9,12], 5))