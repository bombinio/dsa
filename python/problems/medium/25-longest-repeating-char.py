# You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
#
# Return the length of the longest substring containing the same letter you can get after performing the above operations.


# not working
class Solution(object):
    # TODO
    def characterReplacement(self, s, k):
        output = 0
        start = 0
        maxRepeatsChar = 0
        maxChar = ''
        otherChar = 0
        prevMap = {}
        for l in range(len(s)):
            if s[l] in prevMap:
                prevMap[s[l]] += 1
                maxRepeatsChar = max(prevMap[s[l]], maxRepeatsChar)
                if prevMap[s[l]] == maxRepeatsChar:
                    maxChar = s[l]
                else:
                    otherChar += 1
                if maxRepeatsChar + k >= l - start + 1:
                    maxRepeatsChar = l
                    output = max(maxRepeatsChar, output)
                else:
                    output = max(maxRepeatsChar + k, output)
                start = l
                prevMap = {}
                maxRepeatsChar = 0


            else:
                prevMap[s[l]] = 1


        return output

sol = Solution()
print(sol.characterReplacement('AABABBA', 1))