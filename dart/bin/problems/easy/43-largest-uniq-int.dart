// Given an integer array nums, return the largest integer that only occurs once. If no integer occurs once, return -1.

// Algos
// 1) Track all numbers in hashmap and their occurrences
// 2) iterate through hashmap and search maxValue with occurrence === 1

// Key point: track numbers using hashmap

class Solution {
  int largestUniqueNumber(List<int> nums) {
    int largest = -1;
    final prevMap = {};
    for (int i = 0; i < nums.length; i++) {
      prevMap[nums[i]] = prevMap.containsKey(nums[i]) ? prevMap[nums[i]] + 1 : 1;
    }
    for (int key in prevMap.keys) {
      if (prevMap[key] == 1 && key > largest) {
        largest = key;
      }
    }
    return largest;
  }
}