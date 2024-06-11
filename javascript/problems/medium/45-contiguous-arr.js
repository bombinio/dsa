// Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
//
//
//
// Example 1:
//
// Input: nums = [0,1]
// Output: 2
// Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.

// Algos
// 1) Pattern is the same as in 40th and 41st problems, we use prefix sum with hashmap
// 2) Main idea is that, if number is 0 we decrement our currSum otherwise if 1 we increment our currSum
// and now we also save in hashmap currSum as key and length of subarray is value
// 3) For example array [0,0,1,0,0,0,1,1] and our main goal is range [1,0,0,0,1,1]
// Firstly we decrement currSum because nums[0] is 0, currSum is -1 then we check if -1 is in prevMap, if yes
// IT MEANS WE HAD SAME SUM BEFORE and sum did not change so far, so from range prevSum[-1].len to current index
// sum did not change, that's why we save length of subarray in hashmap, but in our case -1 is not in prevMap
// So we continue
// 4) Now nums[1] and again 0, currSum is -2 again not in prevMap so we just add it so prevMap and it's subarray length ( i + 1)
// 5) Now nums[2] and it's 1, currSum is -1, -1 is in prevMap! it means from prevMap[-1].len to current index we have
// same currSum so we just subtract (i + 1 - prevMap[-1].len) again i+1 is current length of subarray and we got current
// maxLength which is 2
// 6) We repeat this process and at the end we have currSum with value -2 and 'i' is 7
// is -2 in prevMap => yes! prevMap[-2] = {len: 2} so we just subtract current length of subarray => (i + 1 - 2)
// 8 - 2  = 6, we check if its more than current maxLength, yes it's more so we assign 6 to maxLength


// Key point: Pattern with hashmap and prefix sum, increment sum if '1' and decrement if '0'

const findMaxLength = function (nums) {
    const prevMap = {0: {len: 0}};
    let currSum = 0;
    let maxLen = 0;
    for (let i = 0; i < nums.length; i++) {
        currSum = (nums[i] === 0) ? currSum - 1 : currSum + 1;

        if (currSum in prevMap) {
            let currLen = i + 1;
            let rangeOfContiguousArr = currLen - prevMap[currSum].len;
            maxLen = Math.max(maxLen, rangeOfContiguousArr);
        } else {
            prevMap[currSum] = {len: i + 1}
        }
    }
    return maxLen;
}

// console.log(findMaxLength([0, 1]))
// console.log(findMaxLength([0, 1, 0]))
// console.log(findMaxLength([0,1,1]))
// console.log(findMaxLength([0,1,1,0,1,1,1,0]))
// console.log(findMaxLength([1,1,0,0,1,1,0,1,1]))
console.log(findMaxLength([0, 0, 1, 0, 0, 0, 1, 1])) // should return 6
// console.log(findMaxLength([1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1]))
// console.log(findMaxLength([1,0,1,0,1,1,0,0,1,0,0,0,1,0,0,0,1,1,0,1,1,0,1,0,0,1,0,0,1,1,0,0,1,1,1,0,0,1,1,0,0,0,1,1,0,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,0,0,0,1,0,1,1,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,1,0,0,0,0,1,0,1,0,0,0,0]))

