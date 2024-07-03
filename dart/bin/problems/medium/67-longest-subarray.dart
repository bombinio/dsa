// Given an array of integers nums and an integer limit, return the size of the longest non-empty subarray such that the absolute difference between any two elements of this subarray is less than or equal to limit.
//
//
//
// https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/description/comments/1566613

// Example 1:
//
// Input: nums = [8,2,4,7], limit = 4
// Output: 2
// Explanation: All subarrays are:
// [8] with maximum absolute diff |8-8| = 0 <= 4.
// [8,2] with maximum absolute diff |8-2| = 6 > 4.
// [8,2,4] with maximum absolute diff |8-2| = 6 > 4.
// [8,2,4,7] with maximum absolute diff |8-2| = 6 > 4.
// [2] with maximum absolute diff |2-2| = 0 <= 4.
// [2,4] with maximum absolute diff |2-4| = 2 <= 4.
// [2,4,7] with maximum absolute diff |2-7| = 5 > 4.
// [4] with maximum absolute diff |4-4| = 0 <= 4.
// [4,7] with maximum absolute diff |4-7| = 3 <= 4.
// [7] with maximum absolute diff |7-7| = 0 <= 4.
// Therefore, the size of the longest subarray is 2.


// Algos: sliding window + monotonic queue
// 1) Create increasing and decreasing monotonic queues and use while loop to fill these arrays in each iteration
// and declare left variable as 0, because we will use sliding window
// 2) if firstNum in decreasing queue - firstNum in increasing queue is bigger than limit, we check: 'Why is our
// window no longer meeting the limit?' by comparing nums[left] === firstNum of increasing queue or decreasing
// and .shift() this number from queue we can find number after which limit broke
// 3) If our window is OK, then we just find max between maxLen and length of window(i-left+1)

// why exactly nums[left] ? For example array [1000, 100, 50, 20, 10, 3, 2, 1] limit is 5
// when we meet element 3 => we have these Decr and Incr arrays => decr: [1000,100,50,20,10, 3] and incr: [3]
// and left is 0, using left we can check what number breaks constraints and also using left we can check size of window

// Key point: create two monotonic increasing and decreasing queues and declare 'left' variable to find size of window
// if firstNum in decreasing queue - firstNum in increasing queue is bigger than limit, we check: 'Why is our
// window no longer meeting the limit?' by comparing nums[left] === firstNum of increasing queue or decreasing
// and .pop() this number from queue we can find number after which limit brok

import 'dart:collection';
import 'dart:math';

class Solution {
  int longestSubarray(List<int> nums, int limit) {
    final Queue<int>queueDecreasing = DoubleLinkedQueue<int>();
    final queueIncreasing = DoubleLinkedQueue<int>();
    int longestSubarrLen = 0;
    int left = 0;
    for (int i = 0; i < nums.length; i++) {
      while (queueDecreasing.isNotEmpty && nums[i] > nums[queueDecreasing.last] ) {
        queueDecreasing.removeLast();
      }
      queueDecreasing.add(i);
      while (queueIncreasing.isNotEmpty && nums[i] < nums[queueIncreasing.last] ) {
        queueIncreasing.removeLast();
      }
      queueIncreasing.add(i);
      while ( (nums[queueDecreasing.first] - nums[queueIncreasing.first]).abs() > limit) {
        if (nums[queueDecreasing.first] == nums[left]) {
          queueDecreasing.removeFirst();
        } else if (nums[queueIncreasing.first] == nums[left]) {
          queueIncreasing.removeFirst();
        }
        left++;
      }
      longestSubarrLen = max(longestSubarrLen, i - left + 1);
    }
    return longestSubarrLen;
  }
}