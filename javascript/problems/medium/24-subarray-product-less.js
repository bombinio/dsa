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
    let subarrays = 0;
    let currProduct = 1;
    while (right < nums.length) {
        currProduct *= nums[right] // 60
        while (currProduct >= k) {
            currProduct = Math.floor(currProduct / nums[left]) // 10
            left++; // 1
        }
        if (left > right) {
            right = left;
            currProduct = 1;
            continue;
        }
        subarrays += (right - left) + 1 // 5 + (3 - 1 + 1) = 8
        right++; // 4
    }
    return subarrays
}

console.log(numSubarrayProductLessThanK([10,5,2,6], 100))
console.log(numSubarrayProductLessThanK([1,2,3], 0))
console.log(numSubarrayProductLessThanK([1,2,3,4,5], 1))