// Given an array of integers nums and an integer limit, return the size of the longest non-empty subarray such that the absolute difference between any two elements of this subarray is less than or equal to limit.
//
//
//
// Example 1:
//
// Input: nums = [8,2,4,7], limit = 4
// Output: 2
// Explanation: All subarrays are:
// [8] with maximum absolute diff |8-8| = 0 <= 4.
// [8,2] with maximum absolute diff |8-2| = 6 > 4.
// [8,2,4] with maximum absolute diff |8-2| = 6 > 4.
// [8,2,4,7] with maximum absolute diff |8-2| = 6 > 4.
// [2] with maximum absolute diff |2-2| = 0 <= 4.
// [2,4] with maximum absolute diff |2-4| = 2 <= 4.
// [2,4,7] with maximum absolute diff |2-7| = 5 > 4.
// [4] with maximum absolute diff |4-4| = 0 <= 4.
// [4,7] with maximum absolute diff |4-7| = 3 <= 4.
// [7] with maximum absolute diff |7-7| = 0 <= 4.
// Therefore, the size of the longest subarray is 2.

// TODO

const longestSubarray = function (nums, limit) {
    let queueInc = [];
    let queueDecr = [];
    let maxOutput = 0;
    let right = 0;
    let left = 0;
    while (right < nums.length) {
        while (nums[right] > nums[queueInc[queueInc.length - 1]]) {
            queueInc.pop();
        }
        queueInc.push(right)

        while (nums[right] < nums[queueDecr[queueDecr.length - 1]]) {
            queueDecr.pop();
        }
        queueDecr.push(right);

        while (nums[queueInc[0]] - nums[queueDecr[0]] > limit) {
            if (nums[queueInc[0]] === nums[left]) {
                queueInc.shift();
            } else if (nums[queueDecr[0]] === nums[left]) {
                queueDecr.shift();
            }
            left++;
        }

        maxOutput = Math.max(maxOutput, right - left + 1);
        right++;
    }
    return maxOutput;
}

// console.log(longestSubarray([10,1,2,4,7,2], 5));
// console.log(longestSubarray([4,2,2,2,4,4,2,2], 0));
// console.log(longestSubarray([8], 10));
console.log(longestSubarray([1, 5, 6, 7, 8, 10, 6, 5, 6], 4));