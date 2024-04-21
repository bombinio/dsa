# Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
#
# You must write an algorithm that runs in O(n) time.
#
#
#
# Example 1:
#
# Input: nums = [100,4,200,1,3,2]
# Output: 4
# Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

# Algorithm
# Let's add all numbers to hashSet, it will delete all duplicates and also give us
# opportunity of searching elements with O(1) complexity

# How to understand that there is sequence? for example [0,6,2,1,3,4,9] -> here is we have sequence [0,1,2,3,4]
# But how to detect it? We need just check if key-1(it's only O(1)! exists in hashSet
# if yes we increase our counter, then we do the
# same for key-1, check if it has left 'child' and so on, but if we check for 2 his key-1 and for 3 his key-1
# so we also need additional check if our hashSet has key+1 number, so we will only check from sequence tail
# Complexity ~ if every time we meet collision then only converting array to hashset will O(n^2)
# But overall complexity is around O(n)

class Solution(object):
    def longestConsecutive(self, nums):
        if (len(nums) == 0): return 0
        prevSet = set(nums)
        counter = 1
        tmpCounter = 0
        for key in prevSet:
            if key - 1 in prevSet and key + 1 not in prevSet:
                tmpCounter += 1
                while key - 1 in prevSet:
                    tmpCounter += 1
                    key = key - 1
                    if key - 1 not in prevSet:
                        if (counter < tmpCounter): counter = tmpCounter
                        tmpCounter = 0

        return counter


sol = Solution()
print(sol.longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
