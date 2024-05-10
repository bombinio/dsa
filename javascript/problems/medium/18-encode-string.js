// Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.
//
// Please implement encode and decode
//
// Example 1:
//
// Input: ["neet","code","love","you"]
//
// Output:["neet","code","love","you"]

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