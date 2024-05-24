// Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
//
// Return the running sum of nums.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,4]
// Output: [1,3,6,10]
// Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

// Algos
// 1) Just using prefix sum algos, we can find it

const runningSum = function(nums) {
    const prefix = [nums[0]]
    for (let i = 1; i < nums.length; i++) {
        prefix.push(nums[i] + prefix[prefix.length-1])
    }
    return prefix;
}

console.log(runningSum([1,2,3,4]))