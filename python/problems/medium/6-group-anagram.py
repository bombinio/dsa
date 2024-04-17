# Given an array of strings strs, group the anagrams together. You can return the answer in any order.
#
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
# typically using all the original letters exactly once.
#
# Example 1:
#
# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]


# Algorithm is pretty straightforward, almost like problem 5-anagram
# go through each word and sort it, if this word is not in hashmap we add sorted word as key, but as value
# our original word
# if sorted word is already in hashmap, we just append original word to this key:value pair in hashmap
# why we sorted word? because now it's easy to compare words that's are anagrams and it takes only O(1) for hashmap

class Solution(object):
    def groupAnagrams(self, strs):
        prevMap = {}
        for word in strs:
            sortedWord = ''.join(sorted(word))
            if sortedWord in prevMap:
                prevMap[sortedWord].append(word)
                continue
            prevMap[sortedWord] = [word]
        output = []
        for key in prevMap:
            output.append(prevMap[key])
        return output

sol = Solution()
print(sol.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))