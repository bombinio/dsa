// You are given an integer array nums consisting of n elements, and an integer k.
//
// Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.
//
//
//
// Example 1:
//
// Input: nums = [1,12,-5,-6,50,3], k = 4
// Output: 12.75000
// Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

// Algos
// 1) Algos is sliding window, firstly we create sliding window in range 'k' and finding its sum and average number
// 2) Then we just move our window -1 and +1 to search new maxAverage number and return it in the end

// Key points: Declare sliding window and move it slowly

import 'dart:math';

class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int sum = 0;
    for (int i = 0; i < k; i++) {
      sum += nums[i];
    }
    double maxAverage = sum / k;
    int left = 0;
    int right = k;
    while (right < nums.length) {
      sum -= nums[left];
      sum += nums[right];
      maxAverage = max(maxAverage, sum / k);
      right++;
      left++;
    }
    return maxAverage;
  }
}