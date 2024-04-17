#Given an integer array nums and an integer k, return the k
# most frequent elements. You may return the answer in any order.
import collections
# Example 1:
#
# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]


class Solution(object):
    def topKFrequent(self, nums, k):
        # TODO


sol = Solution()
print(sol.topKFrequent([4,1,-1,2,-1,2,3], 2))