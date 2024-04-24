# Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.


# Algorithm:
# Save length of word before word and some symbol after length of word: like \ or # so we know when length part ends
# because it can be word '222' or '10lengthtenn' so it's better to save as '10\lengthtenn' now we know that 10 characters
# after '\' is the word. Now when we encoded words in 1 string we go through this string, we create loop from i to the
# end of length of string. then we do i=j(i=0, j=0) and j looks for \ symbol, until str[j] is not \ we increment it
# when str[j] is \ we just slice everything between i and j => it can be 4 or 44 and convert it to int, awesome, we
# got length of word right now now we know length of word and where this word starts(j+1) and we just append this word
# to output array => start(j+1) to end(j+1 + word length), for 'neet' it's [j+1:len('neet')+j+1] = [2:6], mostly
# i is our pointer for length of word and j is pointer for symbol '\'
# and we increase our 'i' index it's now just j+1 + length of word so next iteration starts from
# length of next word

# Whole algorithm is here: https://www.youtube.com/watch?v=B1k_sxOSgv8

class Solution:

    def encode(self, strs):
        output = ''
        for word in strs:
            output += f"{len(word)}\\{word}"
        return output

    def decode(self, str):
        output = []
        i = 0
        while i < len(str) - 1:
            j = i
            while str[j] != '\\' and j < len(str) - 1:
                j += 1
            wordLen = int(str[i:j])
            output.append(str[j+1:wordLen+j+1])
            # print(output)
            i = j + 1 + wordLen
            # print(i)
        return output


sol = Solution()
testWord = '4\\neet4\\code4\\love'
print(sol.encode(["neet", 'code', 'love']))
print(sol.decode(testWord))
print(testWord[2:6])


