# Given two strings s and t, return true if t is an anagram of s, and false otherwise.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
# Example 1:
# Input: s = "anagram", t = "nagaram"
# Output: true

# solution is pretty simple, just to sort both strings and compare them, letters are numbers in ASCII table so we can sort them

class Solution(object):
    def isAnagram(self, s, t):
        sOutput = ' '.join(sorted(s))
        tOutput = ' '.join(sorted(t))
        if sOutput != tOutput:
            return False
        return True




sol = Solution()
print(sol.isAnagram('nana', 'anna'))