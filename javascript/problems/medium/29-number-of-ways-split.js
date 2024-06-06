// You are given a 0-indexed integer array nums of length n.
//
// nums contains a valid split at index i if the following are true:
//
//     The sum of the first i + 1 elements is greater than or equal to the sum of the last n - i - 1 elements.
//     There is at least one element to the right of i. That is, 0 <= i < n - 1.
//
// Return the number of valid splits in nums.
//
//
//
// Example 1:
//
// Input: nums = [10,4,-8,7]
// Output: 2
// Explanation:
// There are three ways of splitting nums into two non-empty parts:
// - Split nums at index 0. Then, the first part is [10], and its sum is 10. The second part is [4,-8,7], and its sum is 3. Since 10 >= 3, i = 0 is a valid split.
// - Split nums at index 1. Then, the first part is [10,4], and its sum is 14. The second part is [-8,7], and its sum is -1. Since 14 >= -1, i = 1 is a valid split.
// - Split nums at index 2. Then, the first part is [10,4,-8], and its sum is 6. The second part is [7], and its sum is 7. Since 6 < 7, i = 2 is not a valid split.
// Thus, the number of valid splits in nums is 2.


// Algos
// 1) Firstly we need to calculate prefix sum to know sum at every iteration
// 2) Then last sum in prefix sum array is sum of all numbers in input array
// 3) Knowing that, we can now find every sum in array with every range, e.g we start at index 0 at compare split:
// [0,0] against [1,nums.length-1], range [0,0] is 10 and  [1,nums.length-1] is sum of all numbers (just last number in prefix array)
// minus range [0,0] => 13 - 10 = 3, right section sum is 3, 3 is less then 10 so split [0,0] and [1,3] is legal
// then range [0,1] this range is just prefix[i] => 14, and [2,3] range is 13 - range [0,1] = -1, -1 is smaller then 14
// so we have one more legal split

// Key points: Find prefix sum and then find leftSection sum and rightSection sum

const waysToSplitArray = function(nums) {
    const prefix = [nums[0]]
    let splits = 0;
    for (let i = 1; i < nums.length; i++) {
        prefix.push(nums[i] + prefix[prefix.length-1])
    }
    console.log(prefix)
    for (let i = 0; i < prefix.length-1; i++) {
        const difference = prefix[prefix.length-1] - prefix[i]
        if (difference <= prefix[i]) {
            splits++
        }
    }
    return splits;
}

console.log(waysToSplitArray([10,4,-8,7]))
console.log(waysToSplitArray([2,3,1,0]))
