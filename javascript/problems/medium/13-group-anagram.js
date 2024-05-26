// Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//
//
// Example 1:
//
// Input: strs = ["eat","tea","tan","ate","nat","bat"]
// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

// super cool algorithm, by neetcode(https://www.youtube.com/watch?v=vzdNOK2oB2E&t=202s)
// Algos
// 1) we know that all input strings are lowercase words(a-z) we can represent them in numbers, char 'a' is 97 and
// 'z' is 122
// 2) knowing this, we can create matrix with size 26 with zeros, and increment by one index in matrix, when we meet char
// that represents this index
// 3) Then we can save this word in hashmap with matrix as key, if we have same matrix fo different words, it means they
// are anagrams

// Key points: Save in hashmap matrix with size 26, that represents word

const groupAnagrams = function(strs) {
     let prevMap = {};
    for (let i = 0; i < strs.length; i++) {
        let matrix = Array(26).fill(0);
        for (let j = 0; j < strs[i].length; j++) {
            let diff = strs[i][j].charCodeAt() - 97
            matrix[diff]++
        }
        if (matrix in prevMap) {
            prevMap[matrix].push(strs[i])
        } else {
            prevMap[matrix] = [strs[i]]
        }
    }
    return Object.values(prevMap)
}
console.log('a'.charCodeAt())
console.log('z'.charCodeAt())

console.log(groupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat']))