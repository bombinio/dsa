// Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.
//
// Note that after backspacing an empty text, the text will continue empty.
//
//
//
// Example 1:
//
// Input: s = "ab#c", t = "ad#c"
// Output: true
// Explanation: Both s and t become "ac".
//
// Example 2:
//
// Input: s = "ab##", t = "c#d#"
// Output: true
// Explanation: Both s and t become "".
//
// Example 3:
//
// Input: s = "a#c", t = "b"
// Output: false
// Explanation: s becomes "c" while t becomes "b".

// Algos
// 1) Use stack for both strings, if character is '#' pop from stack last character
// 2) Compare both stacks, firstly by length if not equal length then of course strings not equal too
// 3) Compare them in third loop by checking firstStack[i] !== secondStack[i]

// Key point: use stack DS

class Solution {
  bool backspaceCompare(String s, String t) {
    final sStack = [];
    final tStack = [];
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '#') {
        if (sStack.isEmpty) {
          continue;
        } else {
          sStack.removeLast();
        }
      } else {
        sStack.add(s[i]);
      }
    }
    for (int i = 0; i < t.length; i++) {
      if (t[i] == '#') {
        if (tStack.isEmpty) {
          continue;
        } else {
          tStack.removeLast();
        }
      } else {
        tStack.add(t[i]);
      }
    }
    if (sStack.length != tStack.length) {
      return false;
    } else {
      for (int i = 0; i < sStack.length; i++) {
        if (sStack[i] != tStack[i]) {
          return false;
        }
      }
    }
    return true;
  }
}

void main() {
  print(Solution().backspaceCompare('y#fo##f', 'y#f#o##f'));
}
