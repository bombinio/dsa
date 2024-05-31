// You are given a 0-indexed array nums consisting of positive integers. You can choose two indices i and j, such that i != j, and the sum of digits of the number nums[i] is equal to that of nums[j].
//
// Return the maximum value of nums[i] + nums[j] that you can obtain over all possible indices i and j that satisfy the conditions.
//
//
//
// Example 1:
//
// Input: nums = [18,43,36,13,7]
// Output: 54
// Explanation: The pairs (i, j) that satisfy the conditions are:
// - (0, 2), both numbers have a sum of digits equal to 9, and their sum is 18 + 36 = 54.
// - (1, 4), both numbers have a sum of digits equal to 7, and their sum is 43 + 7 = 50.
// So the maximum sum that we can obtain is 54.

// TODO

const maximumSum = function (nums) {
    const prevMap = {};
    let maxSum = -1;
    for (let i = 0; i < nums.length; i++) {
        let digitsSum = 0;
        let tmpNum = nums[i]
        while(nums[i] / 10 >= 1) {
            let lastDigit = nums[i] % 10;
            nums[i] = Math.floor(nums[i] / 10);
            digitsSum+= lastDigit
        }
        digitsSum+= nums[i]
        if (digitsSum in prevMap) {
            maxSum = Math.max(prevMap[digitsSum] + tmpNum , maxSum)
            if (tmpNum > prevMap[digitsSum]) {
                prevMap[digitsSum] = tmpNum;
            }
        } else {
            prevMap[digitsSum] = tmpNum;
        }
    }
    return maxSum
}

console.log(maximumSum([18,43,36,13,7, 122]))