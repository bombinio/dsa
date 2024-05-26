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

// Algos
// 1) Just rename it to => you can have 'k' zeros in your subarray(sliding window) and it becomes simpler
// 2) we declare two pointers at index 0(left and right) and amount of zeros, then we move our right pointer, if we meet
// 0 we increment 'zeros' variable, if zeros > k => we launch while loop and move our tail of sliding window('left'
// pointer, if array[left] is 0 we decrement 'zeros' variable because we just removed 0 from our sliding window
// if did not meet 0, then we just do 'output = Math.max(output, right - left which is length of window)' to find
// biggest subarray;

// Key points: Just rename it to => you can have 'k' zeros in your subarray(sliding window) and it becomes simpler


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