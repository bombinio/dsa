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

// Algos: sliding window
// 1) Again, declare two pointers, left = 0, right = 0, currProduct(shows product in subarray), subArrays(amount of legal
// subarrays that passes our condition in task
// 2) So we multiply our current product by right pointer, if product is bigger then 'k' we shrink our window,
// Otherwise we increase subArrays variable by length of window ( right - left + 1), for example window [1,2,3] k = 10
// length is 3, legal subarrays => [1] [1,2] [1,2,3]

// Key point:
// 1) Sliding window, if product is less then 'k' increase output variable(subArrays) by length of window

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