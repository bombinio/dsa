// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,1]
// Output: true

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo
// 1) Use hashmap to track visited numbers, it only takes O(1) to check if number in hashmap
// 2) If number in hashmap, return true

// Key points: 1) hashmap is awesome

class Solution {
  bool containsDuplicate(List<int> nums) {
    final prevMap = {};
    for (int i = 0; i < nums.length; i++) {
      if (prevMap.containsKey(nums[i])) {
        return true;
      }
      prevMap[nums[i]] = i;
    }
    return false;
  }
}