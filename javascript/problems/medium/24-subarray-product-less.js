// Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.
//
//
//
// Example 1:
//
// Input: nums = [10,5,2,6], k = 100
// Output: 8
// Explanation: The 8 subarrays that have product less than 100 are:
// [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
// Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.

const numSubarrayProductLessThanK = function(nums, k) {
    let left = 0;
    let right = 0;
    let currProduct = 1;
    let subArrays = 0;
    while (right < nums.length) {
        currProduct *= nums[right]
        while (currProduct >= k) {
            currProduct /= nums[left]
            left++;
        }
        if (left <= right) {
            subArrays += (right - left) + 1;
        }
        right++;
    }
    return subArrays
}

console.log(numSubarrayProductLessThanK([10,5,2,6], 100))