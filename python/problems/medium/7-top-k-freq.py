#Given an integer array nums and an integer k, return the k
# most frequent elements. You may return the answer in any order.
import collections
from operator import itemgetter


# Example 1:
#
# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]


# Algorithm:
# 1) create hashmap and iterate through nums array and add each num as key and as value -> 1. If num repeats increment
# value of this key
# 2) sort hashmap by its values
# 3) create output array and in range of [0..k] push first key of sorter hashmap

class Solution(object):
    def topKFrequent(self, nums, k):
        prevMap = {}
        for num in nums:
            if num in prevMap:
                prevMap[num] += 1
                continue
            prevMap[num] = 1
        output = []
        for key in prevMap:
            output.append([key, prevMap[key]])
        topk = sorted(prevMap.items(), key=itemgetter(1), reverse=True)[0:k]
        print(topk)
        output = []
        for tup in topk:
            output.append(tup[0])
        return output


sol = Solution()
print(sol.topKFrequent([4,1,-1,2,-1,2,3], 2))