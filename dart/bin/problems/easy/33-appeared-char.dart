// Example 1:
//
// Input: s = "abccbaacz"
// Output: "c"
// Explanation:
// The letter 'a' appears on the indexes 0, 5 and 6.
// The letter 'b' appears on the indexes 1 and 4.
// The letter 'c' appears on the indexes 2, 3 and 7.
// The letter 'z' appears on the index 8.
// The letter 'c' is the first letter to appear twice, because out of all the letters the index of its second occurrence is the smallest.

// Algos
// 1) use hashmap to track visited letters

// Key point: use hashmap or hashset

class Solution {
  String repeatedCharacter(String s) {
    final prevSet = Set<String>();
    for (int i = 0; i < s.length; i++) {
      if (prevSet.contains(s[i])) {
        return s[i];
      } else {
        prevSet.add(s[i]);
      }
    }
    return '';
  }
}