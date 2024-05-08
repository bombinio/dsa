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