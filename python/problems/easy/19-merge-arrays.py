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


class Solution(object):
    def merge(self, nums1, m, nums2, n):
        for k in range(n):
            nums1[m+k] = 1000

        print(nums1, 'here')

        i = 0
        j = 0
        tmp = 0

        while i < m and j < n:
            if nums1[i] <= nums2[j]:
                i += 1
            else:
                nums1[m+j] = nums1[i]
                tmp += 1
                nums1[i] = nums2[j]
                i += 1
                j += 1

        if j < n:
            for k in range(j-tmp, n):
                if i < m + n:
                    print(i, j)
                    if nums1[i] <= nums2[j]:
                        i += 1
                    else:
                        nums1[i + 1] = nums1[i]
                        nums1[i] = nums2[j]
                        i += 1
                        j += 1


        return nums1


sol = Solution()
print(sol.merge([4,0,0,0,0,0], 1, [1,2,3,5,6], 5))
