// Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
//
//
//
// Example 1:
//
// Input: nums = [3,0,1]
// Output: 2
// Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

// Algos
// 1) Saving numbers in hashmap
// 2) In second loop check, if currentNum - 1 or currentNum + 1 is not in hashmap, if yes, we return this number
// 3) But of course we check that this number is in range [0:n] => num >= 0 and num <= nums.length

// Key point: use hashmap to check nums + 1 and - 1

const missingNumber = function(nums) {
    const prevMap = {}
    for (let i = 0; i < nums.length; i++) {
        prevMap[nums[i]] = i;
    }
    for (let i = 0; i < nums.length; i++) {
        let searchNumLess = nums[i]-1
        let searchNumBig = nums[i]+1
        if (!(searchNumBig in prevMap) && searchNumBig <= nums.length) {
            return searchNumBig
        } else if (!(searchNumLess in prevMap) && searchNumLess >= 0) {
            return searchNumLess
        }
    }
}

console.log(missingNumber([9,6,4,2,3,5,7,0,1]))