# remove duplicates
# Input: nums = [0,0,1,1,1,2,2,3,3,4]
# Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
# Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
# It does not matter what you leave beyond the returned k (hence they are underscores).

# Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
#
# Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
#
#     Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
#     Return k.


# using algorithm 2 Pointers
# array is sorted and we want to move duplicates to the end of the array
# one pointer to iterate through array, and second pointer 'n' is range of numbers that are not duplicates [0,n]
# So if array is sorted it means we can meet duplicates only in range of (i to i-1) for example array of
# [1,1,1], n = 0, i = 0
# for i in range of len([1,1,1]) -> if i = 0(because first number is always unique) or ourArr[i] != ourArr[i-1] as I said above
# then arr[n] = arr[i] => arr[0] = 1 and increment n to move our pointer forward
# next iteration => i = 1; n = 1; arr[1] == arr[1-0] so we continue, and the same for arr[2] == arr[2-1] so the output will be
# [1,1,1] = 1
# for example for [2,2,5] first two iteration the same but arr[2] != arr[2-1] and n=1 so now => arr[n] = arr[2] and n++;
# output [2,5,5] we override 2 with 5, but in range [0,n] we get only unique numbers => [2,5]
class Solution(object):
    # def removeDuplicate(self, nums):
    #     output = []
    #     for i in nums:
    #         if i not in output:
    #             output.append(i)
    #     return output
    def removeDuplicate(self, nums):
        n = 0
        for i in range(len(nums)):
            if i == 0 or nums[i] != nums[i - 1]:
                nums[n] = nums[i]
                n += 1

        return n
        # return nums[:n]


sol = Solution()
print(sol.removeDuplicate([2,5,5])) # [2,5]
