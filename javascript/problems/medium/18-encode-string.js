// Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.
//
// Please implement encode and decode
//
// Example 1:
//
// Input: ["neet","code","love","you"]
//
// Output:["neet","code","love","you"]

// 1) To encode string, firstly put length of word at the start and '#' symbol after length, it will help to decode it
// 2) To decode it, we use i and j pointers to find length of word, firstly i = 0 and j = 1, while j won't meet
// '#' it means we are still in range of 'length of word', if str[j] is '#' that means range [i:j] is length of word
// so we can concatenate it variable wordLength and convert it to number, now we have index where word start ('j+1') and
// length of word, we just need again 'cut' it from string and put to array => str.slice(j+1, wordLen + j + 1) and then
// put 'i' index to the end of word, to find new words

// Key point: encode every word as 'word.length#word'

class Solution {
    encode(strs) {
        let output = ''
        for (let word of strs) {
            output += `${word.length}#${word}`
        }
        return output
    }

    decode(str) {
        let output = []
        for (let i = 0; i < str.length; i++) {
            let j = i
            while (str[j] !== '#') {
                j++;
            }
            let wordLength = 0
            for (let k = i; k < j; k++) {
                wordLength += str[k]
                console.log(i, j)
            }
            wordLength = Number(wordLength)
            output.push(str.slice(j+1, wordLength + j + 1))
            i = j+1 + wordLength - 1
        }
        return output
    }
}

let sol = new Solution()
let res = sol.encode(["we","say",":","yes","!@#$%^&*()"])
console.log(res)
console.log(sol.decode(res))