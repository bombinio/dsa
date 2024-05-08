// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//
//
// Example 1:
//
// Input: s = "anagram", t = "nagaram"
// Output: true

const isAnagram = function(s,t) {
    const sMap = {}
    const tMap = {}
    if (s.length !== t.length) return false
    for (let i = 0; i < s.length; i++) {
        if (s[i] in sMap) sMap[s[i]]++
        else sMap[s[i]] = 1
        if (t[i] in tMap) tMap[t[i]]++
        else tMap[t[i]] = 1
    }
    for (let key in sMap){
        if (sMap[key] !== tMap[key]) return false
    }
    return true;
}

console.log(isAnagram('rat', 'car'))