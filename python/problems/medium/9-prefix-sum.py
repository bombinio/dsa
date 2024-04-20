# Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
#
# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
#
# You must write an algorithm that runs in O(n) time and without using the division operation.
#
#
#
# Example 1:
#
# Input: nums = [1,2,3,4]
# Output: [24,12,8,6]

# Algorithm is to make prefix and postfix arrays, calculate prefix for each range of array and postfix, and then
# calculate for each number his prefix[n-1] * postfix[n*1] to understand product of array except self
# solution is O(3n) ~ O(n) but still very slow

class Solution(object):
    def productExceptSelf(self, nums):
        prefix = [1] * len(nums)
        postfix = [1] * len(nums)
        n = 0
        # print(prefix[0])
        for i in range(len(nums)):
            if i == 0:
                prefix[n] = nums[i]
                n += 1
                continue
            prefix[n] = prefix[n-1] * nums[i]
            n += 1
        k = len(nums) - 1
        for j in range(len(nums)-1, -1, -1):
            if j == len(nums)-1:
                postfix[k] = nums[k]
                k -= 1
                continue
            postfix[k] = postfix[k+1] * nums[j]
            k -= 1
        output = []
        for h in range(len(nums)):
            if h == 0:
                output.append(postfix[1])
                continue
            if h == len(nums) - 1:
                output.append(prefix[len(nums)-2])
                continue
            output.append(prefix[h-1] * postfix[h+1])

        return output

sol = Solution()
print(sol.productExceptSelf([1,2,3,4]))
