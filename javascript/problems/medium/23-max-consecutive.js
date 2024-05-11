// Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.
//
//
//
// Example 1:
//
// Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
// Output: 6
// Explanation: [1,1,1,0,0,1,1,1,1,1,1]
// Bolded numbers were flipped from 0 to 1. The longest subarray is underlined

const longestOnes = function (nums, k) {
    let zeros = 0;
    let left = 0;
    let right = 0;
    let output = 0;
    while (right < nums.length) {
        if (nums[right] === 0) {
            zeros++;
            while (zeros > k) {
                if (nums[left] === 0){
                    zeros--
                }
                left++;
            }
            right++;
            output = Math.max(output, (right - left))
        }
        else {
            right++
            output = Math.max(output, (right - left) )
        }
    }
    return output;
}

console.log(longestOnes([1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0], 2))