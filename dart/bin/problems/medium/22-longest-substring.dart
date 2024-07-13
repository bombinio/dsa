// Given a string s, find the length of the longest
// substring
// without repeating characters.
//
//
//
// Example 1:
//
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.

// Algos: sliding window
// 1) Declare two pointers, left(first letter, 0) right(second letter, 1) and hashset
// 2) Hashset helps us to track letters that repeats, but just doing .has(letter) we check if it is in substring
// If it is, we shrink our window, but before of course we compare current size of window(right - left) with output,
// previous max window
// 3) If letter repeats, we shrink window and delete tail of our window
// 4) if letter does not repeat our window only grows

// Key point: sliding window, hashset to track repeating letters

import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    if (s.length < 2) {
      return s.length;
    }
    int left = 0;
    int right = 1;
    final prevSet = Set();
    int longest = 0;
    prevSet.add(s[left]);
    while (right < s.length) {
      while(prevSet.contains(s[right])) {
        prevSet.remove(s[left]);
        left++;
      }
      prevSet.add(s[right]);
      longest = max(longest, right - left + 1);
      right++;
    }
    return longest;
  }
}