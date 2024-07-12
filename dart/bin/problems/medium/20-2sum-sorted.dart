// Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.
//
// Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
//
// The tests are generated such that there is exactly one solution. You may not use the same element twice.
//
// Your solution must use only constant extra space.
//
//
//
// Example 1:
//
// Input: numbers = [2,7,11,15], target = 9
// Output: [1,2]
// Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo:
// 1) Save every number in hashmap
// 2) At every iteration, find difference between current number and target
// 3) If their difference in hashmap, return their index, otherwise add new key:value to hashmap, with index as value

// Key points: 1) Saving previous number in hashmap, to reach them in next iterations


class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    final prevMap = {};
    for (int i = 0; i < numbers.length; i++) {
      int diff = target - numbers[i];
      if (prevMap.containsKey(diff)) {
        return [prevMap[diff] + 1, i + 1];
      }
      prevMap[numbers[i]] = i;
    }
    return [];
  }
}