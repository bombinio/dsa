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
    const output = [];
    for (let i = 0; i < nums.length-1; i++) {
        if (i === 0) {
            output[1] = nums[i]
            output[0] = nums[i]
        }
        else {
            output[i+1] = output[i] * nums[i]
        }
    }
    console.log(output)
    let postfix = 1;
    for (let i = nums.length - 1; i > 0; i--) {
        postfix *= nums[i]
        if (i === nums.length - 1) {
            output[i-1] *= postfix
        }
        else {
            output[i-1] = postfix
        }
    }
    return output;
}

// console.log(productExceptSelf([1,2,3,4]))
console.log(productExceptSelf([-1,1,0,-3,3]))
