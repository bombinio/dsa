// Write a function that reverses a string. The input string is given as an array of characters s.
//
// You must do this by modifying the input array in-place with O(1) extra memory.
//
//
//
// Example 1:
//
// Input: s = ["h","e","l","l","o"]
// Output: ["o","l","l","e","h"]

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo 2 pointers
// 1) initialise left and right pointers (0, arr.length-1)
// 2) while left < right, we swap letters

// Key points:

class Solution {
  void reverseString(List<String> s) {
    int left = 0;
    int right = s.length-1;
    while (left < right) {
      String tmp = s[left];
      s[left] = s[right];
      s[right] = tmp;
      left++;
      right--;
    }
  }
}