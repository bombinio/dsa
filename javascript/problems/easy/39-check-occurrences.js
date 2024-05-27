// Given a string s, return true if s is a good string, or false otherwise.
//
// A string s is good if all the characters that appear in s have the same number of occurrences (i.e., the same frequency).
//
//
//
// Example 1:
//
// Input: s = "abacbc"
// Output: true
// Explanation: The characters that appear in s are 'a', 'b', and 'c'. All characters occur 2 times in s.

// Algos
// 1) Add every char as key in hashmap and value => number of it occurrences
// 2) declare variable numberOfOccurs which represent number of occurrences of first letter in string
// 3) If some letter has not the same num of occurrences as first letter, it means occurrences are not equal

// Key point: Use hashmap to save occurrences and variable that represent occurrences of first letter

const areOccurrencesEqual = function(s) {
    const prevMap = {}
    for (let i = 0; i < s.length; i++) {
        prevMap[s[i]] = (s[i] in prevMap) ? prevMap[s[i]] + 1 : 1;
    }
    const numberOfOccurs = prevMap[s[0]]
    for (let i = 0; i < s.length; i++) {
        if (prevMap[s[i]] !== numberOfOccurs)  return false
    }
    return true;
}

console.log(areOccurrencesEqual('abacbc'))