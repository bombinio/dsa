// You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
//
// Merge nums1 and nums2 into a single array sorted in non-decreasing order.
//
// The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
//
//
//
// Example 1:
//
// Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
// Output: [1,2,2,3,5,6]
// Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
// The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algos
// 1) Nums1 array is already the size of summary array, mostly its algo from sorting array by merging, but in 1 array and harder
// 2) Last number of each array (m-1 and n-1) are their smallest so comparing them we can find biggest of them
// if m-1 is bigger we add to end of nums1 m-1 and decrement it to m-2, otherwise we do the but with 'n'
// 3) We end loop, only when k is <= i, it means we iterated through whole array.

// Key points: Idea is to override values of array by pointer 'k' with value that we get from comparing 'i' and 'j' pointers

class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    int finalArrayPointer = m + n - 1;
    int nums1Pointer = m - 1;
    int nums2Pointer = n - 1;
    while (nums1Pointer < finalArrayPointer) {
      if (nums1[nums1Pointer] > nums2[nums2Pointer] && nums2Pointer >= 0 && nums1Pointer >= 0) {
        nums1[finalArrayPointer] = nums1[nums1Pointer];
        nums1Pointer--;
        finalArrayPointer--;
      } else {
        nums1[finalArrayPointer] = nums2[nums2Pointer];
        nums2Pointer--;
        finalArrayPointer--;
      }
    }
  }
}