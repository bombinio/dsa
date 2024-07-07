// The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.
//
// You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.
//
// For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.
//
// Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

// Algos: monotonic stack
// 1) Use monotonic decreasing stack to find next greater number and save it in hashmap
// 2) In second loop check if current number in hashmap, if yes then in output array, with current index, put
// value of hashmap with key as current number

// Key point: Use monotonic decreasing stack + hashmap to save current number and his next greater element

class Solution {
  List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
    final stackDecreasing = [];
    final nextBiggestIndex = {};
    final output = List.filled(nums1.length, -1, growable: false);
    for (int i = 0; i < nums2.length; i++) {
      while(stackDecreasing.isNotEmpty && nums2[i] > nums2[stackDecreasing[stackDecreasing.length-1]]) {
        int prevBiggestNumIndex = stackDecreasing.removeLast();
        nextBiggestIndex[nums2[prevBiggestNumIndex]] = nums2[i];
      }
      stackDecreasing.add(i);
    }

    for (int i = 0; i < nums1.length; i++) {
      if (nextBiggestIndex.containsKey(nums1[i])) {
        output[i] = nextBiggestIndex[nums1[i]];
      }
    }
    return output;
  }
}