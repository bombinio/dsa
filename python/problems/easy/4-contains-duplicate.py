# Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
# algorithm using hashMap, complexity O(n) => we check if number is in hashMap if yes return true
# we store num as key and his value is index and comparing every iteration current number with previous
class Solution(object):
    def containsDuplicate(self, nums):
        prevMap = {}
        for i, n in enumerate(nums):
            if n in prevMap:
                return True
            prevMap[n] = i
        return False


sol = Solution()
print(sol.containsDuplicate([0,4,5,0,3,6]))
