// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
//
// You must write an algorithm that runs in O(n) time.
//
//
//
// Example 1:
//
// Input: nums = [100,4,200,1,3,2]
// Output: 4
// Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

// Algos
// 1) Add all numbers to hashset
// 2) Check if current number - 1 is in hashset(does not it have 'tail') and does not it have 'head'(currNum + 1) if it
// has tail but also head, we skip iteration and just wait until we will meet head, so we dont do extra moves.
// 3) When we met head(does have tail but does not have 'head' currNum + 1) we launch 'while' loop and check all
// currNum - 1 numbers and increment tmp counter, then we compare tmp counter with global counter and return global
// counter at the end

// Key point: Add all numbers to hashset and check if currNum - 1 is hashSet and currNum + 1 is not hashset(we dont need
// to do extra moves)

import 'dart:math';

class Solution {
  int longestConsecutive(List<int> nums) {
    if (nums.isEmpty) {
      return 0;
    }
    final prevMap = {};
    int longest = 1;
    for (int i = 0; i < nums.length; i++) {
      prevMap[nums[i]] = 1;
    }
    for (var key in prevMap.keys) {
      var prevKey = key-1;
      var nextKey = key+1;
      if (prevMap.containsKey(prevKey) && !prevMap.containsKey(nextKey)) {
        int tmpLongest = 1;
        while (prevMap.containsKey(prevKey)) {
          prevKey = prevKey - 1;
          tmpLongest += 1;
        }
        longest = max(longest, tmpLongest);
      }
    }
    return longest;
  }
}