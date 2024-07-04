// https://leetcode.com/problems/maximum-number-of-balloons/description/
// Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
//
// You can use each character in text at most once. Return the maximum number of instances that can be formed.
//
//
//
// Example 1:
//
// Input: text = "nlaebolko"
// Output: 1

// Algos
// 1) Use hashmap to track occurrence of each letter
// 2) Divide letters 'l' and 'o' by two, because in word 'balloon' they are repeat
// 3) Save of values in output array
// 4) Find min value in output array => how many times we can make word 'balloon'

// Key point: use hashmap to track occurrence of each letter in word 'balloon'

import 'dart:math';

class Solution {
  int maxNumberOfBalloons(String text) {
    final balloonLetters = <String, int>{'b': 0, 'a': 0, 'l': 0, 'o': 0, 'n': 0};
    for (int i = 0; i < text.length; i++) {
      if (balloonLetters.containsKey(text[i])) {
        balloonLetters[text[i]] = (balloonLetters[text[i]] ?? 0) + 1;
      }
    }
    balloonLetters['l']  = balloonLetters['l']! ~/ 2;
    balloonLetters['o']  = (balloonLetters['o'] ?? 1) ~/ 2;
    int minWordsCanMake = balloonLetters['b']!;
    for (var key in balloonLetters.keys) {
      minWordsCanMake = min(minWordsCanMake, balloonLetters[key] ?? 100);
    }
    return minWordsCanMake;
  }
}

void main() {
  print(Solution().maxNumberOfBalloons('balllloooon'));
}
