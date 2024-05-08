# You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
#
# Return the length of the longest substring containing the same letter you can get after performing the above operations.


# not working
class Solution(object):

    def findMax(self, dict):
        max = 0
        for key in dict:
           if dict[key] > max:
              max = dict[key]

        return max
    def characterReplacement(self, s, k):
        left = output = 0
        prevMap = {}
        for right in range(len(s)):
            if s[right] in prevMap:
                prevMap[s[right]] += 1
            else:
                prevMap[s[right]] = 1
                maxRepeat = self.findMax(prevMap)
                while (right - left + 1) - maxRepeat > k:
                    prevMap[s[left]] -= 1
                    left += 1

                output = max(right - left + 1, output)

        return output

sol = Solution()
print(sol.characterReplacement('AABABBA', 1))