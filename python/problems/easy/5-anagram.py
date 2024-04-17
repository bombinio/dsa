# Given two strings s and t, return true if t is an anagram of s, and false otherwise.
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
# Example 1:
# Input: s = "anagram", t = "nagaram"
# Output: true

# solution is pretty simple, just to sort both strings and compare them, letters are numbers in ASCII table so we can sort them

class Solution(object):
    # def isAnagram(self, s, t):
    #     sOutput = ' '.join(sorted(s))
    #     tOutput = ' '.join(sorted(t))
    #     if sOutput != tOutput:
    #         return False
    #     return True

    # second solution
    # we add every letter to hashmap, and if it repeats we increment amount of this letter, by default it's 1
    # then we compare hashmaps of these words, their values of letters
    def isAnagram(self, s, t):
        if len(s) != len(t): # if length of words is different they are not anagrams
            return False
        sHash = {}
        tHash = {}
        for char in s:
            sHash[char] = 1 + sHash.get(char, 0)  # .get() works for dict like this -> if we did not find this key in
            # dict, then default value = 2nd parameter of .get() in our case = 0
        for char in t:
            tHash[char] = 1 + tHash.get(char, 0)

        for c in sHash:
            if sHash[c] != tHash.get(c, 0):
                return False

        return True


sol = Solution()
print(sol.isAnagram('nana', 'anna'))
