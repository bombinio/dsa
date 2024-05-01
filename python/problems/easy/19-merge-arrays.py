# You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
#
# Merge nums1 and nums2 into a single array sorted in non-decreasing order.
#
# The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
#
#
#
# Example 1:
#
# Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
# Output: [1,2,2,3,5,6]
# Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
# The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

# Algorithm:
# 1) Make 3 pointers => 1 for biggest number for first array, second for biggest number of second array, and third for
# end of output array
# 2) We know that array is sorted => last number is the biggest, we compare last numbers, and bigger one => add to the
# end of the output array
# 3) For example arrays => [4,5,6,0,0,0] and [1,2,3]; first pointer(i) = 2, second(j) = 2, third(k) = 5;
# 4) Compare arr1[i] with arr2[j], biggest one => add to the end of output array, and decrement pointer
# 5) after comparing we got this: [4,5,6,0,0,6] i--; k--; i=1, j=2, k=4; next iteration => [4,5,6,0,5,6] i--; k--;
# i = 0, j = 2, k = 3; next = [4,5,6,4,5,6] i--; k--; i=-1, j=2, k=3; Now our first pointer is negative number
# It means we compared all numbers of first array with second, and all numbers that left in second array, are
# automatically become next citizens of first array, we just move them from second array to first, until 'i<k'
# if i == k, it means we added all numbers from second array


class Solution(object):
    def merge(self, nums1, m, nums2, n):
        i = m - 1
        j = n - 1
        k = (m + n) - 1
        while i < k:
            print(nums1, k, i, j)
            if i >= 0 and nums1[i] > nums2[j]:
                nums1[k] = nums1[i]
                k -= 1
                i -= 1
            else:
                nums1[k] = nums2[j]
                j -= 1
                k -= 1

        return nums1


sol = Solution()
print(sol.merge([4, 0, 0, 0, 0, 0], 1, [1, 2, 3, 5,6], 5))
