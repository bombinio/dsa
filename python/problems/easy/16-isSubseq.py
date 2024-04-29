# Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
#
# A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
#
#
#
# Example 1:
#
# Input: s = "abc", t = "ahbgdc"
# Output: true

# Algorithm 2 Pointers

class Solution(object):
    def isSubsequence(self, s, t):
        if len(s) == 0:
            return True
        elif len(t) == 0:
            return False
        i = 0
        j = 0
        while j < len(t) and i < len(s):
            if s[i] == t[j]:
                i += 1
            j += 1

        return i == len(s)

sol = Solution()
print(sol.isSubsequence('', 'ahbgdc'))

