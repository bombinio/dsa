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

/*
------------------------------------------------------------------------------------------------------------------------
 */
// Algo 2 pointers
// 1) Init variable, that will monitor, did we meet all letters from string 's' in from 't'
// 2) If we met char from string 's' increment this variable
// 3) After traversing through string 't' if length of string 's' === our variable, it means we found all characters
// of string 's' in string 't'

// Key points: ...

class Solution {
  bool isSubsequence(String s, String t) {
    if (s.isEmpty) return true;
    int sPointer = 0;
    for (int i = 0; i < t.length; i++) {
      if (sPointer < s.length && t[i] == s[sPointer]) {
        sPointer++;
      }
    }
    return sPointer == s.length;
  }
}