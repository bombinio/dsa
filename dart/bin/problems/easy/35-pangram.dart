// A pangram is a sentence where every letter of the English alphabet appears at least once.
//
// Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.
//
//
//
// Example 1:
//
// Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
// Output: true
// Explanation: sentence contains at least one of every letter of the English alphabet.

// Algos
// 1) WE know amount of letters = 26, so we can create matrix of size 26 with zeros
// 2) If we met letter we increment matrix with index of this letter in alphabet
// 3) AFter all we check if matrix has element with value zero, if yes, some letter did not appear in string

// Key point: Declare matrix with size 26

class Solution {
  bool checkIfPangram(String sentence) {
    final matrix = List.filled(26, 0, growable: false);
    for (int i = 0; i < sentence.length; i++) {
      int letterIndex = sentence.codeUnitAt(i) - 97;
      matrix[letterIndex]++;
    }
    return !matrix.contains(0);
  }
}

void main() {
  print(Solution().checkIfPangram('thequickbrownfoxjumpsoverthelazydog'));
}
