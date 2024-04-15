# Problem 1

# two Sum

# algorithm two pointers:
# if we know that array is sorted:
# if first number with index 0 and last number with array length > target then we decrease index of last number
# else first number with index 0 and last number with array length < target then we increase index of first number

class Solution(object):
    # def twoSum(self, nums, target):
    #     s = 0
    #     e = len(nums)-1
    #     sorted = nums[:]
    #     sorted.sort()
    #     while s < e:
    #         if sorted[s] + sorted[e] == target:
    #             return [nums.index(sorted[s]), nums.index(sorted[e], nums.index(sorted[s])+1)]
    #         elif sorted[s] + sorted[e] > target:
    #             e -= 1
    #         else:
    #             s += 1
    #
    #     return 'not found'


    # using Hashmap we can store numbers and their index as their value in hashMap, then in loop substact every number
    # from target and check if that number is in hashMap, if yes we return current index of loop and value of this number
    # in hashmap, otherwise we add this number to hashmap with his index, hashmap is more faster way, becuase it takes
    # only O(1) to search any number
    def twoSum(self, nums, target):
        prevNums = {}
        for i, num in enumerate(nums):
            diff = target - num
            if diff in prevNums:
                return [prevNums[diff], i]
            prevNums[num] = i


solution = Solution()
print(solution.twoSum([2, 2, 1], 4))