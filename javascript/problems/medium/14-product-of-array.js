// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
//
// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
// You must write an algorithm that runs in O(n) time and without using the division operation.
//
//
//
// Example 1:
//
// Input: nums = [1,2,3,4]
// Output: [24,12,8,6]

const productExceptSelf = function(nums) {
    let prefix = [nums[0]];
    let postfix = Array(nums.length).fill(0);
    postfix[nums.length-1] = nums[nums.length-1]
    let output = [];
    for (let i = 1; i < nums.length; i++) {
        prefix.push(nums[i] * prefix[i-1])
    }
    for (let i = nums.length-2; i >= 0; i--) {
        postfix[i] = (nums[i] * postfix[i + 1])
    }
    for (let i = 0; i < nums.length; i++) {
        if (i === 0) {
            output.push(postfix[i + 1]);
            continue;
        }
        if (i === nums.length - 1) {
            output.push(prefix[i - 1])
            continue;
        }
        else {
            output.push(prefix[i-1] * postfix[i + 1])
        }
    }
    return output
}

console.log(productExceptSelf([1,2,3,4]))