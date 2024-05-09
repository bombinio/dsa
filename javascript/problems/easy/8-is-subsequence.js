// Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
//
// A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
//
//
//
// Example 1:
//
// Input: s = "abc", t = "ahbgdc"
// Output: true


const isSubsequence = function(s,t) {
    let lettersMeetings = 0;
    for (let i = 0; i < t.length; i++) {
        if (s[lettersMeetings] === t[i]) {
            lettersMeetings++;
        }
    }
    return lettersMeetings === s.length
}

console.log(isSubsequence('abc', 'ahgdcb'))