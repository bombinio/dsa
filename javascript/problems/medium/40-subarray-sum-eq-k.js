// Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
//
// A subarray is a contiguous non-empty sequence of elements within an array.
//
//
//
// Example 1:
//
// Input: nums = [1,1,1], k = 2
// Output: 2

// Key point: Almost the same as with prefix sum, but we use hashmap

const subarraySum = function(nums, k) {
    const prevMap = {0: 1}
    let output = 0;
    let currSum = 0;
    for (let i = 0; i < nums.length; i++) {
        currSum += nums[i]
        if ( (currSum - k) in prevMap ) {
            output += prevMap[currSum - k]
        }
        prevMap[currSum] = currSum in prevMap ? prevMap[currSum] + 1 : 1;
    }
    console.log(prevMap)
    return output;
}

// console.log(subarraySum([1,2, 1, 2, 1], 3))
// console.log(subarraySum([1,2, 3], 0))
console.log(subarraySum([-1,-1, 1], 0))
console.log(subarraySum([1,-1, 0], 0))
console.log(subarraySum([1], 0))
