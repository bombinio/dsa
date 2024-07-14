// There is an integer array nums sorted in ascending order (with distinct values).
//
// Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
//
// Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
//
// You must write an algorithm with O(log n) runtime complexity.
//
//
//
// Example 1:
//
// Input: nums = [4,5,6,7,0,1,2], target = 0
// Output: 4

// Algos
// 1) firstly we can't use binary search here, as we do, we have to modify it slightly
// 2) In rotated arrays we can compare middle with right boundary, if right pointer is bigger than element with middle index, it means
// this area is sorted, otherwise other half is sorted
// 3) we compare left pointer and mid, if left is less then mid => it means left half is sorted, and shift is in other half(right)
// 4) then we check if our target in range ( target >= left pointer and <= right pointer) if yes, then we go search into this half
// otherwise we go to 'spaghetti part of solution'
// 5) firstly we compare mid and right pointers, if mid is less then half [mid:right] is sorted
// 6) if target is less then mid, then we should search in left half, because after mid, number are only higher
// 7) if target is bigger then right pointer(biggest number in right half) we should search in left half
// 8) and if target is bigger then mid, it means target in range [mid:right]

// Key point: Look for boundaries in rotated sorted array
//TODO
class Solution {
  int search(List<int> nums, int target) {
    int left = 0;
    int right = nums.length - 1;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[mid] == target) return mid;
      if (nums[mid] < nums[right] &&
          (target > nums[mid] && target <= nums[right])) {
        left = mid + 1;
      } else if (nums[mid] > nums[right] && (target <= nums[right])) {
        left = mid + 1;
      } else if (target > nums[left]) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return -1;
  }
}
