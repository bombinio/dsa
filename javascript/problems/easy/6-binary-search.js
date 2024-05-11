// Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
//
// You must write an algorithm with O(log n) runtime complexity.
//
//
//
// Example 1:
//
// Input: nums = [-1,0,3,5,9,12], target = 9
// Output: 4
// Explanation: 9 exists in nums and its index is 4

/*
------------------------------------------------------------------------------------------------------------------------
 */

// 1) Idea is to always shrink possible range of array to find our 'needle in a haystack'
// 2) For example target is 9, mid = 2, 9 > 3 => search in range [mid + 1, rightBoundary], current right boundary is
// size of array - 1 = 5, range is [3,5]. Next mid is 4 => we found target, return it. What if target was 12?
// in this case new range is [mid+1, rightBoundary] => [5, 5] in current call stack, rightBoundary is 5
// mid = (5 + 5) / 2 = 5, we found target

// Key points: 1) shrink possible space on every iteration

const search = function(nums, target, left=0, right=nums.length-1) {
    const mid = Math.floor((left + right) / 2);
    if (nums[mid] === target) return mid;
    if (left >= right) return -1;
    else if (nums[mid] > target) return search(nums, target, left, mid-1)
    else if (nums[mid] < target) return search(nums,target, mid+1, right)
}

console.log(search([-1,0,3,5,9,12], 9))