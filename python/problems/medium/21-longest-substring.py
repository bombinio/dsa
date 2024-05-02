# Given a string s, find the length of the longest
# substring
# without repeating characters.
#
#
#
# Example 1:
#
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# Algorithm Sliding window Technique!!
# 1) Initialise left and right pointer, no sense to make them point to the same letter in string, so r is 'l+1' letter
# 2) Add first letter to hashset, because it's always unique letter
# 3) as always => while i < len(string) and r < len(string) we check if s[r] letter in hashset (it takes only O(1)!!)
# if it's in hashset we firstly save current length of hashset in our output(result) variable and then, check while
# hashset still has s[r] letter => we delete head of our consequence of letters, and move our 'head' until hashset
# still has s[r] letter, after we removed duplicate we increase right pointer and repeat process and searching for
# new unique consequence

class Solution(object):
    def lengthOfLongestSubstring(self, s):
        if len(s) <= 1:
            return len(s)
        sLength = 0
        l = 0
        prevSet = set(s[l])
        r = 1
        while l < len(s) and r < len(s) :
            tmpLength = 0
            if s[r] in prevSet:
                tmpLength = len(prevSet)
                if tmpLength > sLength:
                    sLength = tmpLength
                while s[r] in prevSet:
                    # print(prevSet, s[l], s[r])
                    prevSet.remove(s[l])
                    l += 1
                prevSet.add(s[r])
                r += 1
            else:
                # print(prevSet, 'in else', s[r])
                prevSet.add(s[r])
                tmpLength = len(prevSet)
                if tmpLength > sLength:
                    sLength = tmpLength
                r += 1

        return sLength

sol = Solution()
print(sol.lengthOfLongestSubstring('pwwkew'))