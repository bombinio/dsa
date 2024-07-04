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

class Solution {
  bool areOccurrencesEqual(String s) {
    final prevLetters = {};
    for (int i = 0; i < s.length; i++) {
      prevLetters[s[i]] = prevLetters.containsKey(s[i]) ? prevLetters[s[i]] + 1 : 1;
    }
    final commonOccurrences = prevLetters[s[0]];
    for (var key in prevLetters.keys) {
      if (prevLetters[key] != commonOccurrences) {
        return false;
      }
    }
    return true;
  }
}