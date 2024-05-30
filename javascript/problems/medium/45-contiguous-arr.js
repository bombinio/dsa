// Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
//
//
//
// Example 1:
//
// Input: nums = [0,1]
// Output: 2
// Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.

// TODO

const findMaxLength = function(nums) {
    const prevMap = {0: 0};
    let maxLength = 0;
    let currSum = 0;
    let currLen;
    for (let i = 0; i < nums.length; i++) {
        currSum += nums[i]
        currLen = i + 1;
        if (currSum > 0) {
            let targetLen = currSum * 2;
            if ( (currLen - targetLen)  in prevMap) {
                if (prevMap[currLen - targetLen] === 0  && targetLen > maxLength) {
                    maxLength = targetLen;
                }
            }
        }
        prevMap[currLen] = currSum;
    }
    console.log(prevMap)
    return maxLength
}

// console.log(findMaxLength([0, 1]))
// console.log(findMaxLength([0, 1, 0]))
// console.log(findMaxLength([0,1,1]))
// console.log(findMaxLength([0,1,1,0,1,1,1,0]))
// console.log(findMaxLength([1,1,0,0,1,1,0,1,1]))
// console.log(findMaxLength([0,0,1,0,0,0,1,1])) // should return 6
console.log(findMaxLength([1,1,1,1,1,1,1,0,0,0,0,1,1,0,1,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,0,1,1,0,0,0,0,1,0,0,1,1,1,1,1,0,0,1,0,1,1,0,0,0,1,0,0,0,1,1,1,0,1,1,0,1,0,0,1,1,0,1,0,0,1,1,1,0,0,1,0,1,1,1,0,0,1,0,1,1]))
