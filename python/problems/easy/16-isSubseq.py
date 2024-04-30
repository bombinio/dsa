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
# Algorithm 2 Pointers
# 1) Initialise 2 pointers, start and end
# 2) Compare current letter of string 's' with string 't', if they are equal increment 'i' and increment 'j'
# always increase 'j' regardless of the result of the comparison
# if i == length of 's', s is consequence of t.
# 3) For example 'abc' and 'abdec', here after loop, 'i' will be the length of 'abc' and function returns True as It
# should. e.g 'abc' and 'acb'. s[i] will find first 'a' but it will find 'b' only in the end of loop, and after end of
# of loop: 'i' == 2' and != 'length of s' it will return False

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

