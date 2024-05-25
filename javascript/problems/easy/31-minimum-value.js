// Given an array of integers nums, you start with an initial positive value startValue.
//
// In each iteration, you calculate the step by step sum of startValue plus elements in nums (from left to right).
//
// Return the minimum positive value of startValue such that the step by step sum is never less than 1.
//
//
//
// Example 1:
//
// Input: nums = [-3,2,-3,4,2]
// Output: 5
// Explanation: If you choose startValue = 4, in the third iteration your step by step sum is less than 1.
// step by step sum
// startValue = 4 | startValue = 5 | nums
//   (4 -3 ) = 1  | (5 -3 ) = 2    |  -3
//   (1 +2 ) = 3  | (2 +2 ) = 4    |   2
//   (3 -3 ) = 0  | (4 -3 ) = 1    |  -3
//   (0 +4 ) = 4  | (1 +4 ) = 5    |   4
//   (4 +2 ) = 6  | (5 +2 ) = 7    |   2

const minStartValue = function (nums) {
    const prefix = [];
    let minSum = 1;
    for (let i = 0; i < nums.length; i++) {
        if (i === 0) {
            prefix.push(minSum + nums[0])
        } else {
            prefix.push(nums[i] + prefix[prefix.length-1])
        }
        minSum = Math.min(minSum, prefix[prefix.length-1])
    }
    if (minSum < 1) {
        return Math.abs(minSum) + 2;
    }
    return minSum;
}

console.log(minStartValue([-3, 2, -3, 4, 2]))
console.log(minStartValue([1,2]))
console.log(minStartValue([1,-2,-3]))
console.log(minStartValue([-5,-2,4,4,-2]))
console.log(minStartValue([2,3,5,-5,-1]))


