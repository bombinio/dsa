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

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo
// 1) Create hashmap for both strings
// 2) Early return => if strings length is different, they cant be anagrams
// 3) Compare in outer loop both hashmaps, if some key(letter) has different value(counts), string are not anagrams

// Key points: 1) Hashmap.

class Solution {
  bool isAnagram(String s, String t) {
    final sMap = {};
    final tMap = {};
    if (s.length != t.length) {
      return false;
    }
    for (int i = 0; i < s.length; i++) {
      sMap[s[i]] = sMap.containsKey(s[i]) ? sMap[s[i]] + 1 : 1;
    }
    for (int i = 0; i < t.length; i++) {
      tMap[t[i]] = tMap.containsKey(t[i]) ? tMap[t[i]] + 1 : 1;
    }
    for (var key in sMap.keys) {
      if (sMap[key] != tMap[key]) {
        return false;
      }
    }
    return true;
  }
}
