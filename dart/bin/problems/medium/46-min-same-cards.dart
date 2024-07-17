// You are given an integer array cards where cards[i] represents the value of the ith card. A pair of cards are matching if the cards have the same value.
//
// Return the minimum number of consecutive cards you have to pick up to have a pair of matching cards among the picked cards. If it is impossible to have matching cards, return -1.
//
//
//
// Example 1:
//
// Input: cards = [3,4,2,3,4,7]
// Output: 4
// Explanation: We can pick up the cards [3,4,2,3] which contain a matching pair of cards with value 3. Note that picking up the cards [4,2,3,4] is also optimal.

// Algos
// 1) Save each visited card in hashmap and her index
// 2) If card repeats calculate length of this subarray (current index - when we met this card) if it's less than
// current global minLength we update minLength
// 3) And dont forget to update this card in hashmap and set new index, for example array [2,1,0,2,2] without updating
// index answer is 4, but right answer is 2

// Key point: use hashmap to save each visited card and her index in array

import 'dart:math';

class Solution {
  int minimumCardPickup(List<int> cards) {
    final prevMap = <int, int>{};
    int minLen = cards.length;
    bool itsFound = false;
    for (int i = 0; i < cards.length; i++) {
      if (prevMap.containsKey(cards[i])) {
        minLen = min(i - prevMap[cards[i]]! + 1, minLen);
        prevMap[cards[i]] = i;
        itsFound = true;
      } else {
        prevMap[cards[i]] = i;
      }
    }
    if (itsFound == true) {
      return minLen;
    }
    return -1;
  }
}