// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
//
//
//
// Example 1:
//
// Input: nums = [-4,-1,0,3,10]
// Output: [0,1,9,16,100]
// Explanation: After squaring, the array becomes [16,1,0,9,100].
// After sorting, it becomes [0,1,9,16,100].

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo 2 pointers
// 1) Array is sorted, and we know that '-' * '-' = '+' so lowest number can be highest in result array
// 2) Init. 2 pointers, and 3rd for output array, we will fill output array from the end
// 3) Compare left and pointers values without their sign and add biggest to output array, increment left or decrement
// right pointer, depends which one has bigger value, decrement pointer of output array, fill it from the end

// Key points : ...

const sortedSquares = function(nums) {
    let left = 0;
    let right = nums.length - 1;
    let outputPointer = nums.length - 1;
    const output = []
    while (left <= right) {
        if (Math.abs(nums[left]) > Math.abs(nums[right])) {
            output[outputPointer] = nums[left] * nums[left]
            left++;
            outputPointer--;
        } else {
            output[outputPointer] = nums[right] * nums[right]
            right--
            outputPointer--;
        }
    }
    return output;
}

console.log(sortedSquares([-4,1,0,3,10]))