// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
// You can return the answer in any order.
//
//
//
// Example 1:
//
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

/*
------------------------------------------------------------------------------------------------------------------------
 */

// Algo:
// 1) Save every number in hashmap
// 2) At every iteration, find difference between current number and target
// 3) If their difference in hashmap, return their index, otherwise add new key:value to hashmap, with index as value

// Key points: 1) Saving previous number in hashmap, to reach them in next iterations

const twoSum = function(nums, target) {
    const prevMap = {}
    for (let i = 0; i < nums.length; i++) {
        if (target - nums[i] in prevMap) {
            let difference = target - nums[i]
            return [prevMap[difference], i]
        } else prevMap[nums[i]] = i;
    }
};
