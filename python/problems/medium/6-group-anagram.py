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
# why we sorted word? because now it's easy to compare words that are anagrams and it takes only O(1) for hashmap

from collections import defaultdict

class Solution(object):
    # def groupAnagrams(self, strs):
    #     prevMap = {}
    #     for word in strs:
    #         sortedWord = ''.join(sorted(word))
    #         if sortedWord in prevMap:
    #             prevMap[sortedWord].append(word)
    #             continue
    #         prevMap[sortedWord] = [word]
    #     output = []
    #     for key in prevMap:
    #         output.append(prevMap[key])
    #     return output

    # second more efficient solution
    # very cool solution: we know that letters are numbers in ASCII table, so we can create array with size of
    # alphabet and for each word we create array of 26 zeros and when we iterate through each word in array, we then
    # iterate through its letters and for each word we create array as key in hashmap, for example for word 'abc'
    # we create array [1,1,1,0,0,0...] and in hashmap this array is key and his value is original word, if we have same
    # key, we append original word to this key, then we just return values of hashmap
    def groupAnagrams(self, strs):
        res = defaultdict(list) # mapping charCount to List of Anagrams

        for s in strs:
            count = [0] * 26 # a ... z
            for c in s:
                count[ord(c) - ord('a')] += 1

            res[tuple(count)].append(s) # we use tuple to make array hashable(Arrays are not hashable!)

        print(res)
        return res.values()

        # O(m*n) solution



sol = Solution()
print(sol.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))