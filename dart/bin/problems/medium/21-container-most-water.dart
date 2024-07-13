// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
//
// Find two lines that together with the x-axis form a container, such that the container contains the most water.
//
// Return the maximum amount of water a container can store.
//
// Notice that you may not slant the container.
//
//
//
// Example 1:
//
// Input: height = [1,8,6,2,5,4,8,3,7]
// Output: 49
// Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

// Algos: 2 pointers
// 1) Declare 2 pointers, start and at the end
// 2) We need to find area of rectangle, but firstly we need to find smallest height from both pointers
// That what exactly we do in variable 'step' and calculate currArea
// 3) Then we just compare currArea with maximum area that we could meet before
// 4) Which pointer to move? We move the smallest one, because we already have snapshot of maximum area at this point
// no point to continue, we should move forward and search other areas

// Key point: 2 pointers, move pointer from the smallest height to calculate new, bigger areas

import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    int biggestArea = 0;
    int left = 0;
    int right = height.length - 1;
    while (left < right) {
      int minHeight = min(height[left], height[right]);
      int tmpArea = minHeight * (right - left);
      biggestArea = max(biggestArea, tmpArea);
      if (height[left] > height[right]) {
        right--;
      } else {
        left++;
      }
    }
    return biggestArea;
  }
}